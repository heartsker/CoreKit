//
//  Created by Daniel Pustotin on 20.06.2023.
//

import Base

extension Task where Failure == Error {
    @discardableResult
    static func retrying(
        retryStrategy: RetryStrategy,
        priority: TaskPriority? = nil,
        operation: @Sendable @escaping () async throws -> Success
    ) -> Task {
        Task(priority: priority) {
            while true {
                do {
                    return try await operation()
                } catch {
                    if case BackendRequesterError.badResponseStatusCode(let httpStatusCode) = error,
                       httpStatusCode.is500 {
                        logger.debug("Unauthorized request, will retry")
                    } else {
                        break
                    }

                    guard retryStrategy.shouldRetry else {
                        break
                    }
                    let delay = retryStrategy.nextRetryInterval()

                    logger.debug("Will retry in \(delay) ms")
                    try await Task<Never, Never>.sleep(for: .milliseconds(delay))
                }
            }

            try Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }
}
