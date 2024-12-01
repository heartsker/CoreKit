//
//  Created by Daniel Pustotin on 29.10.2024
//

import Combine
import Foundation

public protocol StoreProtocol: StateProvider, Dispatcher {}

public final class Store<State>: StoreProtocol {

    private let statesSubject: CurrentValueSubject<State, Never>
    private let actionsSubject: PassthroughSubject<Action, Never>

    private let middlewares: [Middleware]
    private let reducer: Reducer<State>

    private var cancellables = Set<AnyCancellable>()

    @Published public var state: State

    public init(
        initialState: State,
        middlewares: [Middleware] = [],
        reducer: @escaping Reducer<State>
    ) {
        state = initialState

        self.middlewares = middlewares
        self.reducer = reducer

        statesSubject = CurrentValueSubject<State, Never>(initialState)
        actionsSubject = PassthroughSubject<Action, Never>()

        let dispatch: Dispatch = { [weak self] action in
            guard let self = self else { return }
            let newState = reducer(state, action)
            statesSubject.send(newState)
            state = newState
        }

        // Create a dispatch chain using middlewares
        let combinedDispatch = middlewares.reversed().reduce(dispatch) { next, middleware in
            return middleware.interfere(store: self, next: next)
        }

        // Collect actions and apply them to the dispatch chain
        actionsSubject
            .prepend(ReduxAction.initialize) // Send initial action
            .sink(receiveValue: combinedDispatch)
            .store(in: &cancellables)
    }

    public func states() -> AnyPublisher<State, Never> {
        statesSubject.eraseToAnyPublisher()
    }

    public func dispatch(action: Action) {
        actionsSubject.send(action)
    }
}

extension Store: ObservableObject {}
