//
//  Created by Daniel Pustotin on 23.04.2024.
//

import Foundation

final class ExponentialBackoffStrategy: RetryStrategy {
    // MARK: - Public properties

    var shouldRetry: Bool {
        retriesCount < maxRetries
    }

    var logDescription: String {
        "Exponential backoff"
    }

    var info: [String: (any CustomStringConvertible)?] {
        [
            "baseInterval": baseInterval,
            "maxRetries": maxRetries
        ]
    }

    // MARK: - Constructor

    init(
        baseInterval: TimeInterval = 1.0,
        maxRetries: Int = 0
    ) {
        self.baseInterval = baseInterval
        self.maxRetries = maxRetries
    }

    // MARK: - Public methods

    func nextRetryInterval() -> UInt64 {
        guard shouldRetry else {
            preconditionFailure("Retry strategy is exhausted")
        }

        defer {
            retriesCount += 1
        }

        return UInt64(baseInterval * pow(2, Double(retriesCount)) * oneSecond)
    }

    // MARK: - Private properties

    private var retriesCount: Int = 0

    private let baseInterval: TimeInterval
    private let maxRetries: Int

    private let oneSecond = TimeInterval(1_000)
}
