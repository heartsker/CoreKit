//
//  Created by Daniel Pustotin on 03.02.2023.
//

import SwiftUI

private struct ScaleViewModifier: ViewModifier {
    // MARK: - Public properties

    var scale: CGFloat

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .scaleEffect(x: scale, y: scale)
    }
}

public extension View {
    /// Applies scale to the view
    /// - Parameter scale: The scale to apply
    /// - Returns: Modified view
    func scale(_ scale: CGFloat) -> some View {
        modifier(ScaleViewModifier(scale: scale))
    }
}
