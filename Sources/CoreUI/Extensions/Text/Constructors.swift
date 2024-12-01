//
//  Created by Daniel Pustotin on 24.09.2022.
//

import SwiftUI

public extension Text {
    // MARK: - Public properties

    /// Space
    static let space = Text(" ")

    // MARK: - Constructor

    /// Creates a `Text` view with an empty string
    init() {
        self.init(String())
    }

    /// Creates a `Text` view from a `CustomStringConvertible` optional object
    /// By extracting the `description` property, if any
    /// - Parameters:
    ///   - content: The object to create `Text` from
    init(content: CustomStringConvertible?) {
        self.init(content?.description ?? String())
    }
}
