//
//  Created by Daniel Pustotin on 29.11.2023.
//

@propertyWrapper
public struct SharedDependency<T, D: Dependency> {
    private var value: T?
    private var creator: () -> T
    private let component: Component<D>

    public init(scope: Component<D>, creator: @escaping @autoclosure () -> T) {
        self.component = scope
        self.creator = creator
    }

    public var wrappedValue: T {
        mutating get {
            if let value {
                return value
            } else {
                let newValue = component.shared(creator)
                value = newValue
                return newValue
            }
        }
        set {
            value = newValue
        }
    }
}
