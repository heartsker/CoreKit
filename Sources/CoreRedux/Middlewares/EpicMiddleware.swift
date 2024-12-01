//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

class EpicMiddleware<State: Any>: Middleware {
    private let actions = PassthroughSubject<Action, Never>()
    private weak var store: (any StoreProtocol)?

    func interfere(store: any StoreProtocol, next: @escaping Dispatch) -> Dispatch {
        precondition(self.store == nil, "Middleware interference attempted more than once")

        self.store = store
        return { action in
            next(action)
            self.actions.send(action)
        }
    }

    func register(epics: [Epic]) -> AnyCancellable {
        guard let store = store else {
            return AnyCancellable {}
        }

        let mergedPublisher = epics
            .map { epic in
                epic.actInternal(actions: actions.eraseToAnyPublisher())
                    .handleEvents(receiveOutput: { newAction in
                        store.dispatch(action: newAction)
                    })
            }
            .reduce(Empty<Action, Never>().eraseToAnyPublisher()) { accumulator, publisher in
                accumulator
                    .merge(with: publisher)
                    .eraseToAnyPublisher()
            }

        // Return a single cancellable that manages all epic subscriptions
        return mergedPublisher
            .sink(receiveValue: { _ in })
    }
}
