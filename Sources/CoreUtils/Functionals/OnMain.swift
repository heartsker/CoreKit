//
//  Created by Daniel Pustotin on 20.08.2023.
//

import Foundation

//extension Task where Success == Never, Failure == Never {
//    /// Executes the provided async action on the main thread with an optional priority.
//    /// - Parameters:
//    ///   - priority: The priority of the task (default is nil).
//    ///   - action: The async action to be executed on the main thread, which can return a value and throw an error.
//    /// - Returns: The result of the async action.
//    @discardableResult
//    @MainActor
//    static func onMainThread<T>(
//        priority: TaskPriority? = nil,
//        action: @MainActor @escaping () async throws -> T
//    ) async throws -> T {
//        try await Task(priority: priority) { @MainActor in
//            try await action()
//        }.value
//    }
//}
