//
//  Created by Daniel Pustotin on 17.12.2024
//

public protocol ScopeRepresentable {
    associatedtype State
    associatedtype Action: ActionRepresentable

    var reducer: Reducer<State, Action> { get }
}

final public class Scope<State, Action: ActionRepresentable>: ScopeRepresentable {
    // MARK: - Public properties

    public let name: String
    public let reducer: Reducer<State, Action>

    // MARK: - Constructor

    public init(name: String, reducer: @escaping Reducer<State, Action>) {
        self.name = name
        self.reducer = reducer
    }
}
