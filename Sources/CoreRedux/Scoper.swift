//
//  Created by Daniel Pustotin on 18.12.2024
//

public protocol Scoper {
    associatedtype State: StateRepresentable

    func scope<ChildScope>(
        with scope: ChildScope,
        middlewares: [Middleware],
        _ childStateMapper: @escaping SendableMapper<State, ChildScope.State>,
        _ parentActionMapper: SendableModifier<any ActionRepresentable>?
    ) -> Store<ChildScope> where ChildScope: ScopeRepresentable
}