//
//  Created by Daniel Pustotin on 20.06.2023.
//

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
                    try await Task<Never, Never>.sleep(for: .milliseconds(retryStrategy.nextRetryInterval()))
                }
            }

            try Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }
}
