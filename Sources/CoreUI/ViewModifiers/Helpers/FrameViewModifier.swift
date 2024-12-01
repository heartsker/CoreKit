//
//  Created by Daniel Pustotin on 08.12.2022.
//

import SwiftUI

private struct SquareFrameViewModifier: ViewModifier {
    // MARK: - Public properties

    var frameSide: CGFloat

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .frame(width: frameSide, height: frameSide)
    }
}

private struct InfiniteFrameViewModifier: ViewModifier {
    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

public extension View {
    /// Applies square frame to the view
    /// - Parameter side: The side size of the frame
    /// - Returns: Modified view
    func squareFrame(_ side: CGFloat) -> some View {
        modifier(SquareFrameViewModifier(frameSide: side))
    }

    /// Applies infinite frame to the view
    var infiniteFrame: some View { // swiftlint:disable:this private_subviews swiftui_views_naming
        modifier(InfiniteFrameViewModifier())
    }
}
