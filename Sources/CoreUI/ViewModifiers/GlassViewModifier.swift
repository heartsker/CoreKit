//
//  Created by Daniel Pustotin on 11.02.2023.
//

import SwiftUI

private struct GlassViewModifier: ViewModifier {
    // MARK: - Constructor

    init(cornerRadius: CGFloat) {
        self.cornerRadius = cornerRadius
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .background(.thinMaterial)
            .compositingGroup()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    // MARK: - Private properties

    private let cornerRadius: CGFloat
}

public extension View {
    /// Applies glass modifier to the view
    /// - Parameter cornerRadius: Corner radius of the glass
    /// - Returns: Modified view
    func glass(
        cornerRadius: CGFloat = Spacing.m
    ) -> some View {
        self.modifier(GlassViewModifier(cornerRadius: cornerRadius))
    }
}
