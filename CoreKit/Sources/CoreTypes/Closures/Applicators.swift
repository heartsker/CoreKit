//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes an argument and returns nothing
public typealias Applicator<T> = (T) -> Void
/// An async closure that takes an argument and returns nothing
public typealias AsyncApplicator<T> = (T) async -> Void
/// An async throwable closure that takes an argument and returns nothing
public typealias AsyncThrowableApplicator<T> = (T) async throws -> Void
/// A throwable closure that takes an argument and returns nothing
public typealias ThrowableApplicator<T> = (T) throws -> Void

/// A closure that performs any action on given @MainActor action
public typealias MainActorActionWrapper = Applicator<@MainActor () -> Void>
