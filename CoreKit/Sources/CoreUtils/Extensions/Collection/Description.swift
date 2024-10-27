//
//  Created by Daniel Pustotin on 31.10.2022.
//

public extension Collection where Element: CustomStringConvertible {
    /// Returns a string with all elements separated by a given separator
    /// - Parameters:
    ///   - separator: Separator between elements
    ///   - beginning: The word to be pasted before the description
    ///   - lastSeparator: Separator between the last two elements.
    ///   If `nil`, the separator will be the same as the first one
    /// - Returns: String with all elements separated by a given separator
    func description(
        separator: String = ", ",
        beginning: String? = nil,
        lastSeparator: String? = nil
    ) -> String {
        guard count > 1 else {
            return first?.description ?? String()
        }

        var elements = map { $0.description }
        let last = elements.removeLast()

        return (beginning ?? String()) + elements.joined(separator: separator) + (lastSeparator ?? separator) + last
    }
}
