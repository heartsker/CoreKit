//
//  Created by Daniel Pustotin on 09.06.2023.
//

import SwiftUI

/// A view modifier that applies an animated "shimmer" to any view, typically to show that an operation is in progress.
private struct ShimmeringViewModifier: ViewModifier {
    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .mask(
                LinearGradient(
                    gradient: Const.gradient,
                    startPoint: startPoint,
                    endPoint: endPoint
                )
            )
            .onAppear {
                withAnimation(Const.animation) {
                    isInitialState = false
                }
            }
    }

    // MARK: - Private properties

    @State private var isInitialState = true
    @Environment(\.layoutDirection)
    private var layoutDirection

    private var ltrStartPoint: UnitPoint {
        isInitialState ? UnitPoint(x: Const.min, y: 0) : UnitPoint(x: 1, y: 0)
    }

    private var ltrEndPoint: UnitPoint {
        isInitialState ? UnitPoint(x: 0, y: 0) : UnitPoint(x: Const.max, y: 0)
    }

    private var startPoint: UnitPoint {
        layoutDirection == .rightToLeft ? ltrEndPoint : ltrStartPoint
    }

    private var endPoint: UnitPoint {
        layoutDirection == .rightToLeft ? ltrStartPoint : ltrEndPoint
    }

    // MARK: - Private nesting

    private enum Const {
        static let animation = Animation.linear(duration: duration).repeatForever(autoreverses: false)
        static let min: CGFloat = 0 - bandSize
        static let max: CGFloat = 1 + bandSize

        static let gradient = Gradient(
            colors: [
                edgeColor,
                centerColor,
                edgeColor
            ]
        )

        private static let duration: TimeInterval = 2
        private static let bandSize: CGFloat = 0.7
        private static let edgeColor = Palette.commonShadow.opacity(0.5)
        private static let centerColor = Palette.commonShadow
    }
}

public extension View {
    /// Adds an animated shimmering effect to any view, typically to show that
    /// an operation is in progress
    /// - Parameters:
    ///   - isActive: Convenience parameter to conditionally enable the effect. Defaults to `true`
    @ViewBuilder
    func shimmering(when isActive: Bool = true) -> some View {
        if isActive {
            modifier(ShimmeringViewModifier())
        } else {
            self
        }
    }
}
