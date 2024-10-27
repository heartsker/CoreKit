//
//  Created by Daniel Pustotin on 13.05.2023.
//

public extension String {
    /// Adds leading characters to the string up to the specified length
    /// - Parameters:
    ///   - character: The character to add
    ///   - length: The length of the resulting string
    /// - Returns: A string with leading characters added
    func addingLeading(_ character: Character, upTo length: Int) -> String {
        String(repeating: character, count: max(0, length - count)) + self
    }
}
