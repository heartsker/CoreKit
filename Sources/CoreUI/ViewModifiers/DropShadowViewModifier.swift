//
//  Created by Daniel Pustotin on 11.02.2023.
//

import SwiftUI

private struct DropShadowViewModifier: ViewModifier {
    // MARK: - Public properties

    var radius: CGFloat

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .shadow(color: Palette.commonShadow, radius: radius, x: .zero, y: radius / 4)
    }
}

public extension View {
    /// Applies shadow to the view
    /// - Parameters:
    ///   - radius: Shadow radius
    /// - Returns: Modified view
    func dropShadow(
        radius: CGFloat = Spacing.s
    ) -> some View {
        self.modifier(DropShadowViewModifier(radius: radius))
    }
}
