//
//  Created by Daniel Pustotin on 21.10.2022.
//

import SwiftUI

private struct AnimatableFontSizeModifier: AnimatableModifier {
    // MARK: - Public properties

    var size: CGFloat
    var design: Font.Design

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, design: design))
    }
}

public extension View {
    /// Animates font size of the view
    /// - Parameters:
    ///   - size: Font size
    ///   - design: Font design
    /// - Returns: View with animated font size
    func animatableFontSize(
        size: CGFloat,
        design: Font.Design = .default
    ) -> some View {
        self.modifier(AnimatableFontSizeModifier(size: size, design: design))
    }
}
