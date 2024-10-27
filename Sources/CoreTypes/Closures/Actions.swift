//
//  Created by Daniel Pustotin on 07.08.2024.
//

/// A closure that takes nothing and returns nothing
public typealias VoidAction = Emitter<Void>
/// An async closure that takes nothing and returns nothing
public typealias AsyncVoidAction = AsyncEmitter<Void>
/// A throwable closure that takes nothing and returns nothing
public typealias ThrowableVoidAction = ThrowableEmitter<Void>
/// An async throwable closure that takes nothing and returns nothing
public typealias AsyncThrowableVoidAction = AsyncThrowableEmitter<Void>
