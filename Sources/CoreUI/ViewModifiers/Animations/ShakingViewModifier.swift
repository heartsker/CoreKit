//
//  Created by Daniel Pustotin on 14.02.2023.
//

import SwiftUI

private struct ShakingViewModifier: GeometryEffect {
    // MARK: - Public properties

    var animatableData: CGFloat

    // MARK: - Constructor

    init(speed animatableData: CGFloat) {
        self.animatableData = animatableData
    }

    // MARK: - Public methods

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(
                translationX: Const.magnitude * sin(animatableData * .pi * Const.shakesRate),
                y: .zero
            )
        )
    }

    // MARK: - Private nesting

    private enum Const {
        static let shakesRate: CGFloat = 10.0
        static let magnitude: CGFloat = 10.0
    }
}

public extension View {
    /// Applies shaking animation to view
    /// - Parameter isShaking: Whether the view should be shaking or not
    /// - Returns: Modified view
    func shaking(_ shake: Binding<Bool>) -> some View {
        modifier(ShakingViewModifier(speed: shake.wrappedValue ? 10 : 0))
            .animation(.default, value: shake.wrappedValue)
            .onChange(of: shake.wrappedValue) { _ in
                withAnimation(.default.delay(0.1)) {
                    shake.wrappedValue = false
                }
            }
    }
}
