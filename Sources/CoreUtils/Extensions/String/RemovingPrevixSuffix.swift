//
//  Created by Daniel Pustotin on 03.07.2024
//

public extension String {
    /// Returns a copy of the string with the given prefix removed if it exists
    /// - Parameter prefix: The prefix to remove
    func removingPrefix(_ prefix: String) -> String {
        var copy = self
        copy.removePrefix(prefix)
        return copy
    }

    /// Removes the given prefix if it exists
    /// - Parameter prefix: The prefix to remove
    mutating func removePrefix(_ prefix: String) {
        guard hasPrefix(prefix) else {
            return
        }

        removeFirst(prefix.count)
    }

    /// Returns a copy of the string with the given suffix removed if it exists
    /// - Parameter suffix: The suffix to remove
    func removingSuffix(_ suffix: String) -> String {
        var copy = self
        copy.removeSuffix(suffix)
        return copy
    }

    /// Removes the given suffix if it exists
    /// - Parameter suffix: The suffix to remove
    mutating func removeSuffix(_ suffix: String) {
        guard hasSuffix(suffix) else {
            return
        }

        removeLast(suffix.count)
    }
}
