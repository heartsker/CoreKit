//
//  Created by Daniel Pustotin on 24.12.2022.
//

import SwiftUI

private struct RoundedCornersShape: Shape {
    // MARK: - Constructor

    init(radius: CGFloat, corners: UIRectCorner) {
        self.radius = radius
        self.corners = corners
    }

    // MARK: - Public methods

    func path(in rect: CGRect) -> Path {
        Path(
            UIBezierPath(
                roundedRect: rect,
                byRoundingCorners: corners,
                cornerRadii: CGSize(width: radius, height: radius)
            )
            .cgPath
        )
    }

    // MARK: - Private properties

    private let radius: CGFloat
    private let corners: UIRectCorner
}

private struct RoundCornersViewModifier: ViewModifier {
    // MARK: - Constructor

    init(cornerRadius: CGFloat, corners: UIRectCorner) {
        self.cornerRadius = cornerRadius
        self.corners = corners
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        if corners == .allCorners {
            content
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        } else {
            content
                .clipShape(RoundedCornersShape(radius: cornerRadius, corners: corners))
        }
    }

    // MARK: - Private properties

    private let cornerRadius: CGFloat
    private let corners: UIRectCorner
}

public extension View {
    /// Rounds corners of the view
    func roundCorners(
        _ cornerRadius: CGFloat = Radii.s,
        corners: UIRectCorner = .allCorners
    ) -> some View {
        modifier(RoundCornersViewModifier(cornerRadius: cornerRadius, corners: corners))
    }
}
