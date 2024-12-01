//
//  Created by Daniel Pustotin on 24.03.2023.
//

import SwiftUI

private struct OutlinedGradientViewModifier: ViewModifier {
    // MARK: - Constructor

    init(gradient: Gradient, cornerRadius: CGFloat) {
        self.gradient = gradient
        self.cornerRadius = cornerRadius
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .roundCorners(cornerRadius)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing),
                        lineWidth: LineWidth.s
                    )
            }
    }

    // MARK: - Private properties

    private let gradient: Gradient
    var cornerRadius: CGFloat
}

public extension View {
    /// Outlines the view with gradient border
    /// - Parameters:
    ///   - gradient: Gradient of the outline
    ///   - cornerRadius: Corner radius of the outline
    /// - Returns: Modified view
    func outlined(
        gradient: Gradient,
        cornerRadius: CGFloat = Spacing.l
    ) -> some View {
        modifier(OutlinedGradientViewModifier(gradient: gradient, cornerRadius: cornerRadius))
    }
}
