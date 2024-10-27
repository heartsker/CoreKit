//
//  Created by Daniel Pustotin on 01.09.2022.
//

import CoreTypes

/// Applies a closure to an object
/// - Parameters:
///   - object: The object to apply the closure to
///   - action: The closure to apply
/// - Returns: The object
@discardableResult
@inlinable
public func apply<T>(to object: T, action: Applicator<T>) -> T {
    action(object)
    return object
}
