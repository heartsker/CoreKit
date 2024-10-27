//
//  Created by Daniel Pustotin on 13.08.2022.
//

import Foundation

public extension String {
    /// Checks if the string matches the given regular expression
    /// - Parameters:
    ///   - regexString: Regular expression
    /// - Returns: `true` if the string matches the given regular expression, `false` otherwise
    func matches(_ regexString: String) -> Bool {
        guard let regex = try? Regex("^" + regexString + "$") else {
            return false
        }
        return (try? regex.firstMatch(in: self)) != nil
    }

    func matches<T>(_ regex: Regex<T>) -> Bool {
        (try? regex.firstMatch(in: self)) != nil
    }
}

private extension NSRegularExpression {
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: " + pattern)
        }
    }
}
