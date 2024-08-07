//
//  Created by Daniel Pustotin on 21.04.2024.
//

/// Protocol for objects that can be configured with a closure
public protocol Configurable: AnyObject {}

public extension Configurable {
	/// Apply a closure to the object
	/// - Parameter config: The closure to apply
    func apply(_ config: (inout Self) -> Void) {
        var this = self
        config(&this)
    }

	/// Apply a closure to the object and return it
	/// - Parameter config: The closure to apply
	/// - Returns: The object after applying the closure
    func with(_ config: (inout Self) -> Void) -> Self {
        apply(config)
        return self
    }
}
