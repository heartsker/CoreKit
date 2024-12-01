//
//  Created by Daniel Pustotin on 10.03.2023.
//

import SwiftUI

private struct RotatingBorderViewModifier: ViewModifier {
    // MARK: - Constructor

    init(isActive: Bool, cornerRadius: CGFloat) {
        self.isActive = isActive
        self.cornerRadius = cornerRadius
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        guard isActive else {
            return content
                .anyView
        }

        return content
            .overlay {
                LinearGradient(
                    gradient: Palette.brandGradient,
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .mask {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(
                            style: StrokeStyle(
                                lineWidth: Const.lineWidth,
                                lineCap: .round,
                                lineJoin: .round,
                                dash: [5, 30],
                                dashPhase: dashPhase
                            )
                        )
                }
                .onAppear {
                    startAnimation()
                }
            }
            .anyView
    }

    // MARK: - Private methods

    private func startAnimation() {
        withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
            dashPhase = -100
        }
    }

    // MARK: - Private properties

    @State private var dashPhase: CGFloat = Const.maxPhase

    private let isActive: Bool
    private let cornerRadius: CGFloat

    // MARK: - Private nesting

    private enum Const {
        static let lineWidth: CGFloat = 6.0
        static let maxPhase: CGFloat = 100
    }
}

public extension View {
    /// Rounds corners of the view
    func rotatingBorder(
        isActive: Bool = true,
        _ cornerRadius: CGFloat = Spacing.l
    ) -> some View {
        modifier(RotatingBorderViewModifier(isActive: isActive, cornerRadius: cornerRadius))
    }
}
