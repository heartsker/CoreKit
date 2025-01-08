//
//  Created by Daniel Pustotin on 07.01.2025
//

public extension Sequence where Element: Sendable {
    func asyncMap<T: Sendable>(
        _ transform: @escaping @Sendable (Element) async throws -> T
    ) async throws -> [T] {
        let tasks = map { element in
            Task {
                try await transform(element)
            }
        }

        var result = [T]()

        for task in tasks {
            try await result.append(task.value)
        }

        return result
    }
}
