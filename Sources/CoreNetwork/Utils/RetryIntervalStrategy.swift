//
//  Created by Daniel Pustotin on 23.04.2024.
//

public protocol RetryStrategy: Loggable, Sendable {
    var shouldRetry: Bool { get }

    func nextRetryInterval() -> UInt64
}
