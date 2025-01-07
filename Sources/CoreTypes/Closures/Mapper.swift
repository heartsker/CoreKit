//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes an argument and maps it to another value
public typealias Mapper<T, U> = @Sendable (T) -> U
/// A sendable version of ``Mapper``
public typealias SendableMapper<T, U> = @Sendable (T) -> U
