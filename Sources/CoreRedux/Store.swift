//
//  Created by Daniel Pustotin on 29.10.2024
//

import Combine
import Foundation

public protocol StoreRepresentable: StateProvider, Dispatcher {}

public final class Store<StoreScope: ScopeRepresentable>: StoreRepresentable {
    // MARK: - Public properties

    public typealias State = StoreScope.State
    public typealias Action = StoreScope.Action

    @Published public private(set) var state: State {
        didSet {
            statesSubject.send(state)
        }
    }

    // MARK: - Private properties

    private let statesSubject: CurrentValueSubject<State, Never>
    private let actionsSubject: PassthroughSubject<ActionRepresentable, Never>

    private let scope: StoreScope
    private let reducer: Reducer<State, Action>
    private let middlewares: [Middleware]

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Constructor

    public init(
        scope: StoreScope,
        initialState: State,
        middlewares: [Middleware] = []
    ) {
        state = initialState

        self.scope = scope
        reducer = scope.reducer
        self.middlewares = middlewares

        statesSubject = CurrentValueSubject<State, Never>(initialState)
        actionsSubject = PassthroughSubject<ActionRepresentable, Never>()

        let dispatch: Dispatch = { [weak self] action in
            guard let self,
                  let action = action as? Action else {
                return
            }
            reducer(&state, action)
        }

        // Create a dispatch chain using middlewares
        let combinedDispatch = middlewares.reversed().reduce(dispatch) { next, middleware in
            return middleware.interfere(store: self, next: next)
        }

        // Collect actions and apply them to the dispatch chain
        actionsSubject
            .prepend(ReduxAction.initialize)
            .sink(receiveValue: combinedDispatch)
            .store(in: &cancellables)
    }

    // MARK: - Public methods

    public func states() -> AnyPublisher<State, Never> {
        statesSubject.eraseToAnyPublisher()
    }

    public func dispatch(action: Action) {
        actionsSubject.send(action)
    }

    func scope<LocalScope>(
        with scope: LocalScope,
        middlewares: [Middleware],
        _ localStateMapper: @escaping (State) -> LocalScope.State,
        _ globalActionMapper: @escaping (LocalScope.Action) -> Action
    ) -> Store<LocalScope> where LocalScope: ScopeRepresentable {
        Store<LocalScope>(
            scope: scope,
            initialState: localStateMapper(state),
            middlewares: [ScopeMiddleware(globalActionMapper: globalActionMapper)] + middlewares
        )
    }
}

extension Store: ObservableObject {}
