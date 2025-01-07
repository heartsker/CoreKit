//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that emits a value
public typealias Emitter<T> = () -> T
/// A sendable version of ``Emitter``
public typealias SendableEmitter<T> = @Sendable () -> T

/// An async version of ``Emitter``
public typealias AsyncEmitter<T> = () async -> T
/// A throwable version of ``Emitter``
public typealias ThrowableEmitter<T> = () throws -> T
/// An async throwable version of ``Emitter``
public typealias AsyncThrowableEmitter<T> = () async throws -> T
