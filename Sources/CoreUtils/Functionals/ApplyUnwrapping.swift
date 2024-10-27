//
//  Created by Daniel Pustotin on 21.04.2024.
//

import CoreTypes

/// Applies a closure to an object
/// - Parameters:
///   - object: The object to unwrap and apply the closure to
///   - action: The closure to apply
/// - Returns: The object
@discardableResult
@inlinable
public func apply<T, U>(unwrapping object: T?, action: Mapper<T, U>) -> U? {
    guard let object else {
        return nil
    }
    return action(object)
}
