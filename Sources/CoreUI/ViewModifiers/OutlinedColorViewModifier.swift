//
//  Created by Daniel Pustotin on 24.03.2023.
//

import SwiftUI

private struct OutlinedColorViewModifier: ViewModifier {
    // MARK: - Constructor

    init(color: Color, cornerRadius: CGFloat) {
        self.color = color
        self.cornerRadius = cornerRadius
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .roundCorners(cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: LineWidth.s)
            }
    }

    // MARK: - Private properties

    private let color: Color
    var cornerRadius: CGFloat
}

public extension View {
    /// Outlines the view with colored border
    /// - Parameters:
    ///   - color: Color of the outline
    ///   - cornerRadius: Corner radius of the outline
    /// - Returns: Modified view
    func outlined(
        color: Color,
        cornerRadius: CGFloat = Spacing.l
    ) -> some View {
        modifier(OutlinedColorViewModifier(color: color, cornerRadius: cornerRadius))
    }
}
