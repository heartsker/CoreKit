//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes an argument and returns nothing
public typealias Applicator<T> = (T) -> Void
/// A sendable version of ``Applicator``
public typealias SendableApplicator = @Sendable () -> Void

/// An async version of ``Applicator``
public typealias AsyncApplicator<T> = (T) async -> Void
/// A throwable version of ``Applicator``
public typealias ThrowableApplicator<T> = (T) throws -> Void
/// An async throwable version of ``Applicator``
public typealias AsyncThrowableApplicator<T> = (T) async throws -> Void
