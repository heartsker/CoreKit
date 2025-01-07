//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes nothing and returns nothing
public typealias Action = Emitter<Void>
/// A sendable version of ``Action``
public typealias SendableAction = SendableEmitter<Void>

/// An async version of ``Action``
public typealias AsyncAction = AsyncEmitter<Void>
/// A throwable version of ``Action``
public typealias ThrowableAction = ThrowableEmitter<Void>
/// An async throwable version of ``Action``
public typealias AsyncThrowableAction = AsyncThrowableEmitter<Void>
