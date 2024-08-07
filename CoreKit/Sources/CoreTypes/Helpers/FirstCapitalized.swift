//
//  Created by Daniel Pustotin on 07.08.2024.
//

extension String {
    /// Returns a new string with the first character of every word capitalized
    var firstCapitalized: String {
        split(separator: " ")
            .map { $0.prefix(1).capitalized + $0.dropFirst() }
            .joined(separator: " ")
    }
}
