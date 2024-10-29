//
//  Created by Daniel Pustotin on 25.11.2023.
//

public extension Component {
    /// Tracks the creation of an object
    /// - Parameter creator: Object creator
    /// - Returns: Created object
    func create<T>(_ func: String = #function, _ creator: () -> T) -> T {
        let object = creator()

        logger.debug("🤫 Created \(String(describing: T.self))\nScope: [\(description)]")

        return object
    }

    /// Tracks the creation of a shared object
    /// - Parameter creator: Shared object creator
    /// - Returns: Created shared object
    func createShared<T>(_ func: String = #function, _ creator: () -> T) -> T {
        let object = shared(creator)

        logger.debug("🏭 Created \(String(describing: T.self))\nScope: [\(description)]")

        return object
    }
}
