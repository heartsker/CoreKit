//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

class EpicMiddleware<Store: StoreRepresentable>: Middleware {
    private let actions = PassthroughSubject<ActionRepresentable, Never>()
    private weak var store: Store?

    func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch {
        precondition(self.store == nil, "Middleware interference attempted more than once")

        guard let store = store as? Store else {
            fatalError("Store is not of the correct type \(String(describing: store))")
        }

        self.store = store
        return { [weak self] action in
            next(action)
            self?.actions.send(action)
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
                        guard let action = newAction as? Store.Action else {
                            return
                        }
                        store.dispatch(action: action)
                    })
            }
            .reduce(Empty<ActionRepresentable, Never>().eraseToAnyPublisher()) { accumulator, publisher in
                accumulator
                    .merge(with: publisher)
                    .eraseToAnyPublisher()
            }

        // Return a single cancellable that manages all epic subscriptions
        return mergedPublisher
            .sink(receiveValue: { _ in })
    }
}
