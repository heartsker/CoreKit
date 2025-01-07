//
//  Created by Daniel Pustotin on 27.06.2024
//

import SwiftUI

public extension Text {
    init(markdown: String) {
        guard let attributedString = try? AttributedString(
            markdown: markdown,
            options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        ) else {
            self = .empty
            return
        }

        self = Text(attributedString)
    }
}
