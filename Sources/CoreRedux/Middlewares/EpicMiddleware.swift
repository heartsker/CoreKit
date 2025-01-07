//
//  Created by Daniel Pustotin on 30.10.2024
//

import Combine

struct EpicConnectAction: ActionRepresentable {}

public protocol EpicRegisterable {
    func register(epics: [Epic]) -> AnyCancellable?
}

public final class EpicMiddleware<Store: StoreRepresentable>: Middleware, EpicRegisterable {
    private let actions = PassthroughSubject<any ActionRepresentable, Never>()
    private weak var store: Store?

    public init() {}

    public func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch {
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

    public func register(epics: [Epic]) -> AnyCancellable? {
        guard let store = store else {
            fatalError("Middleware not connected to a store")
        }

        let mergedPublisher = epics
            .map { epic in
                epic.actInternal(actions: actions.eraseToAnyPublisher())
                    .handleEvents(receiveOutput: store.dispatch)
            }
            .reduce(Empty<any ActionRepresentable, Never>().eraseToAnyPublisher()) { accumulator, publisher in
                accumulator
                    .merge(with: publisher)
                    .eraseToAnyPublisher()
            }

        defer {
            actions.send(EpicConnectAction())
        }

        // Return a single cancellable that manages all epic subscriptions
        return mergedPublisher
            .sink {
                store.dispatch(action: $0)
            }
    }
}
