//
//  Created by Daniel Pustotin on 21.10.2022.
//

import SwiftUI

private struct AnimatableFontWeightModifier: AnimatableModifier {
    // MARK: - Public properties

    var weight: Font.Weight

    var animatableData: Font.Weight {
        get { weight }
        set { weight = newValue }
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .fontWeight(weight)
    }
}

public extension View {
    /// Animates font weight of the view
    /// - Parameter weight: Font weight
    /// - Returns: View with animated font weight
    func animatableFontWeight(
        weight: Font.Weight
    ) -> some View {
        self.modifier(AnimatableFontWeightModifier(weight: weight))
    }
}
