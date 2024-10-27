//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A no argument closure that returns a value
public typealias Emitter<T> = () -> T
/// A no argument async closure that returns a value
public typealias AsyncEmitter<T> = () async -> T
/// A no argument throwable closure that returns a value
public typealias ThrowableEmitter<T> = () throws -> T
/// A no argument async throwable closure that returns a value
public typealias AsyncThrowableEmitter<T> = () async throws -> T

/// A closure that takes nothing and returns a boolean value
public typealias BoolEmitter = Emitter<Bool>
