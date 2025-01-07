//
//  Created by Daniel Pustotin on 29.10.2024
//

import Combine
import Foundation

public protocol StoreRepresentable: StateProvider, Dispatcher, Scoper, EpicRegisterable, ObservableObject {}
public typealias ScopedStore<Reducer: ReducerRepresentable> = Store<Scope<Reducer>>

public final class Store<StoreScope: ScopeRepresentable>: StoreRepresentable {
    // MARK: - Properties

    public typealias State = StoreScope.State
    public typealias Reducer = StoreScope.Reducer

    @Published public private(set) var state: State {
        didSet {
            statesSubject.send(state)
        }
    }

    private let statesSubject: CurrentValueSubject<State, Never>
    private let actionsSubject: PassthroughSubject<any ActionRepresentable, Never>

    private let scope: StoreScope
    private let reducer: Reducer
    private let middlewares: [Middleware]
    private weak var parentDispatcher: Dispatcher?

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Constructor

    public init(
        scope: StoreScope,
        initialState: State,
        middlewares: [Middleware] = [],
        parentActionMapper: SendableModifier<any ActionRepresentable>? = nil,
        parentDispatcher: Dispatcher? = nil
    ) {
        state = initialState

        self.scope = scope
        reducer = scope.reducer
        self.middlewares = middlewares
        self.parentDispatcher = parentDispatcher

        statesSubject = CurrentValueSubject<State, Never>(initialState)
        actionsSubject = PassthroughSubject<any ActionRepresentable, Never>()

        let dispatch: Dispatch = { [weak self] action in
            guard let self else { return }

            reducer.reduce(&state, action: action)

            if let parentDispatcher, let parentActionMapper {
                parentDispatcher.dispatch(action: parentActionMapper(action))
            }
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

    // MARK: - Methods

    public func states() -> AnyPublisher<State, Never> {
        statesSubject.eraseToAnyPublisher()
    }

    public func dispatch(action: any ActionRepresentable) {
        actionsSubject.send(action)
    }

    public func scope<ChildScope>(
        with scope: ChildScope,
        middlewares: [Middleware],
        _ childStateMapper: @escaping SendableMapper<State, ChildScope.State>,
        _ parentActionMapper: SendableMapper<any ActionRepresentable, any ActionRepresentable>?
    ) -> Store<ChildScope> where ChildScope: ScopeRepresentable {
        Store<ChildScope>(
            scope: scope,
            initialState: childStateMapper(state),
            middlewares: middlewares,
            parentActionMapper: parentActionMapper,
            parentDispatcher: self
        )
    }

    public func register(epics: [Epic]) -> AnyCancellable? {
        (middlewares.first { $0 is EpicMiddleware<Store> } as? EpicMiddleware<Store>)?
            .register(epics: epics)
    }
}

extension Store: ObservableObject {}
