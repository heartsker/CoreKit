//
//  Created by Daniel Pustotin on 11.10.2022.
//

/// Sets a value to an object if a condition is satisfied
/// - Parameters:
///   - object: The object to set the value to
///   - value: The value to set
///   - condition: The condition to satisfy
/// - Returns: The object
@discardableResult
@inlinable
public func set<T>(_ object: inout T, to value: T, if condition: Bool) -> T {
    if condition {
        object = value
    }
    return object
}
