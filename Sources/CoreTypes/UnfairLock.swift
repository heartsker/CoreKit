//
//  Created by Daniel Pustotin on 21.01.2024.
//

import os

final public class UnfairLock: @unchecked Sendable {
    // MARK: - Constructor

    public init() {
        lock = UnsafeMutablePointer<os_unfair_lock>.allocate(capacity: 1)
        lock.initialize(to: os_unfair_lock())
    }

    // MARK: - Destructor

    deinit {
        lock.deallocate()
    }

    // MARK: - Public methods

    public func locked<T>(perform action: () throws -> T) rethrows -> T {
        os_unfair_lock_lock(lock)

        defer {
            os_unfair_lock_unlock(lock)
        }

        return try action()
    }

    public func locked<T>(_ action: @autoclosure () throws -> T) rethrows -> T {
        os_unfair_lock_lock(lock)

        defer {
            os_unfair_lock_unlock(lock)
        }

        return try action()
    }

    // MARK: - Private properties

    private let lock: UnsafeMutablePointer<os_unfair_lock>
}
