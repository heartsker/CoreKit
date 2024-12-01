//
//  Created by Daniel Pustotin on 26.06.2022.
//

import SwiftUI

public extension View {
    /// Animates font of the view
    /// - Parameters:
    ///   - size: Font size
    ///   - weight: Font weight
    ///   - design: Font design
    /// - Returns: View with animated font
    func animatableFont(
        size: FontSize,
        weight: Font.Weight = .regular,
        design: Font.Design = .default
    ) -> some View {
        self
            .animatableFontSize(size: size.rawValue, design: design)
            .animatableFontWeight(weight: weight)
    }
}
