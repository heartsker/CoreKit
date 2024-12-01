//
//  Created by Daniel Pustotin on 14.01.2023.
//

import SwiftUI

private struct FontStyleViewModifier: ViewModifier {
    // MARK: - Constructor

    init(fontStyle: FontStyle) {
        self.fontStyle = fontStyle
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .font(Font(fontStyle: fontStyle))
            .underline(fontStyle.properties.contains(.underlined))
            .italic(fontStyle.properties.contains(.italic))
            .strikethrough(fontStyle.properties.contains(.strikethrough))
    }

    // MARK: - Private properties

    private let fontStyle: FontStyle
}

public extension View {
    /// Applies font style to view
    /// - Parameter style: Font style to apply
    /// - Returns: Modified view
    func fontStyle(_ fontStyle: FontStyle) -> some View {
        modifier(FontStyleViewModifier(fontStyle: fontStyle))
    }
}

public extension Text {
    /// Applies font style to text
    /// - Parameter style: Font style to apply
    /// - Returns: Modified text
    func fontStyle(_ fontStyle: FontStyle) -> Text {
        font(Font(fontStyle: fontStyle))
            .underline(fontStyle.properties.contains(.underlined))
            .italic(fontStyle.properties.contains(.italic))
            .strikethrough(fontStyle.properties.contains(.strikethrough))
    }
}
