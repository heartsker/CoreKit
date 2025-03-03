//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes an argument and returns a boolean value
public typealias Predicate<T> = Mapper<T, Bool>
/// A sendable version of ``Predicate``
public typealias SendablePredicate<T> = SendableMapper<T, Bool>
