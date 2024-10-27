//
//  Created by Daniel Pustotin on 08.11.2022.
//

public extension String {
    /// Removes all whitespaces from the end of the string
    mutating func removeLastWhitespaces() {
        let lastIndex = lastIndex { !$0.isWhitespace } ?? startIndex
        let suffixLength = distance(from: lastIndex, to: endIndex) - 1
        guard suffixLength > 0 else {
            return
        }
        removeLast(suffixLength)
    }

    /// Returns a copy of the string with all whitespaces removed from the end
    var removingLastWhitespaces: String {
        var result = self
        result.removeLastWhitespaces()
        return result
    }
}
