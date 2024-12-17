//
//  Created by Daniel Pustotin on 17.12.2024
//

final class ScopeMiddleware<LocalAction: ActionRepresentable, Action: ActionRepresentable>: Middleware {
    // MARK: - Public properties

    private let globalActionMapper: (LocalAction) -> Action

    // MARK: - Constructor

    init(globalActionMapper: @escaping (LocalAction) -> Action) {
        self.globalActionMapper = globalActionMapper
    }

    // MARK: - Public methods

    func interfere(store: any StoreRepresentable, next: @escaping Dispatch) -> Dispatch {
        { [weak self] action in
            guard let self, let action = action as? LocalAction else {
                fatalError("Action is not of type \(LocalAction.self)")
            }
            next(globalActionMapper(action))
        }
    }
}
