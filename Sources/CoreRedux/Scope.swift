//
//  Created by Daniel Pustotin on 17.12.2024
//

public protocol ScopeRepresentable: AnyObject {
    associatedtype Reducer: ReducerRepresentable

    var reducer: Reducer { get }
}

public extension ScopeRepresentable {
    typealias State = Reducer.State
}

final public class Scope<Reducer: ReducerRepresentable>: ScopeRepresentable {
    // MARK: - Public properties

    public let name: String
    public var reducer: Reducer
    weak var parentDispatcher: Dispatcher?

    // MARK: - Constructor

    public init(
        name: String,
        reducer: Reducer,
        parentDispatcher: Dispatcher? = DummyDispatcher?.none
    ) {
        self.name = name
        self.reducer = reducer
        self.parentDispatcher = parentDispatcher
    }
}

public final class DummyDispatcher: Dispatcher {
    public func dispatch(action: any ActionRepresentable) {}
}
