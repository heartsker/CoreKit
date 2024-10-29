//
//  Created by Daniel Pustotin on 19.07.2024
//

public extension Logger {
    // MARK: - Public methods

    func threadInfo() -> String {
        "🧶 Thread info: \(Thread.isMainThread ? "Main" : "Not main") thread\n"
    }
}
