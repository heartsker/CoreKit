//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes an argument and returns a value of the same type
public typealias Modifier<T> = (T) -> T
/// A sendable version of ``Modifier``
public typealias SendableModifier<T> = @Sendable (T) -> T
