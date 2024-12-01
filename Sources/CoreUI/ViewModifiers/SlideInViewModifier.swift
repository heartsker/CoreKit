//
//  Created by Daniel Pustotin on 21.07.2022.
//

import SwiftUI

/// Direction to slide in
public enum SlideDirection {
    case right
    case left
    case up
    case down
}

private struct SlideInViewModifier: ViewModifier {
    // MARK: - Constructor

    init(isShown: Bool, direction: SlideDirection, initialOffset: CGFloat) {
        self.isShown = isShown
        switch direction {
        case .right:
            offset = .init(width: -initialOffset, height: .zero)

        case .left:
            offset = .init(width: initialOffset, height: .zero)

        case .up:
            offset = .init(width: .zero, height: initialOffset)

        case .down:
            offset = .init(width: .zero, height: -initialOffset)
        }
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .opacity(isShown ? 1 : 0)
            .offset(isShown ? .zero : offset)
    }

    // MARK: - Private properties

    private var isShown: Bool
    private var offset: CGSize
}

public extension View {
    /// Slides in the view towards the specified direction
    /// - Parameters:
    ///   - isShown: Whether the view is shown
    ///   - direction: The direction to slide in
    ///   - initialOffset: The offset of the slide
    func slideIn(
        isShown: Bool,
        to direction: SlideDirection = .up,
        offset initialOffset: CGFloat = 20.0
    ) -> some View {
        self.modifier(SlideInViewModifier(isShown: isShown, direction: direction, initialOffset: initialOffset))
    }
}
