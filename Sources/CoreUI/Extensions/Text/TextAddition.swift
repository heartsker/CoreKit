//
//  Created by Daniel Pustotin on 01.06.2022.
//

import SwiftUI

public extension Text {
    // MARK: Properties

    /// Empty text view
    static let empty = Text()

    // MARK: - Operators

    /// Appends one text view to another
    /// - Parameters:
    ///   - lhs: Text view to append to
    ///   - rhs: Text view to append
    static func += (lhs: inout Text, rhs: Text) {
        lhs = lhs + rhs
    }
}
