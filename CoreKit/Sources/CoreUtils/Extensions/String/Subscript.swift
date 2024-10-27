//
//  Created by Daniel Pustotin on 25.06.2022.
//

public extension String {
    // MARK: - Public subscripts

    /// Gets and sets a substring at a given index.
    /// Negative indices are added to the length so that
    /// substrings can be accessed from the end backwards
    /// - Parameter i: Index of the substring
    /// - Returns: Substring at the given index
    /// - Note: `string[n..<n]` is equivalent to `string[n]`
    subscript(_ i: Int) -> String {
        get {
            String(self[strOpenRange(index: i)])
        }
        set {
            let range = strOpenRange(index: i)
            replaceSubrange(range, with: newValue)
        }
    }

    /// Gets and sets a character at a given index.
    /// Negative indices are added to the length so that
    /// characters can be accessed from the end backwards
    /// - Parameter i: Index of the character
    /// - Returns: Character at the given index
    /// - Note: `string[n]` is equivalent to `string[n..<n]`
    subscript(_ i: Int) -> Character {
        get {
            Character(String(self[strOpenRange(index: i)]))
        }
        set {
            let range = strOpenRange(index: i)
            replaceSubrange(range, with: String(newValue))
        }
    }

    /// Gets and sets a substring in a range.
    /// Supports negative indexing
    /// - Parameter range: Range of the substring
    /// - Returns: Substring in the given range
    /// - Note: `string[n..<n]` is equivalent to `string[n]`
    subscript(_ range: Range<Int>) -> String {
        get {
            String(self[strOpenRange(range)])
        }
        set {
            replaceSubrange(strOpenRange(range), with: newValue)
        }
    }

    // MARK: - Private methods

    private func negativeIndex(_ num: Int) -> Int {
        num < 0 ? num + self.count : num
    }

    private func strOpenRange(index i: Int) -> Range<String.Index> {
        let j = negativeIndex(i)
        return strOpenRange(j..<(j + 1), checkNegative: false)
    }

    private func strOpenRange(_ range: Range<Int>, checkNegative: Bool = true) -> Range<String.Index> {
        var lower = range.lowerBound
        var upper = range.upperBound

        if checkNegative {
            lower = negativeIndex(lower)
            upper = negativeIndex(upper)
        }

        let idx1 = index(self.startIndex, offsetBy: lower)
        let idx2 = index(self.startIndex, offsetBy: upper)

        return idx1..<idx2
    }

    private func strClosedRange(
        _ range: CountableClosedRange<Int>,
        checkNegative: Bool = true
    ) -> ClosedRange<String.Index> {
        var lower = range.lowerBound
        var upper = range.upperBound

        if checkNegative {
            lower = negativeIndex(lower)
            upper = negativeIndex(upper)
        }

        let start = self.index(self.startIndex, offsetBy: lower)
        let end = self.index(start, offsetBy: upper - lower)

        return start...end
    }
}
