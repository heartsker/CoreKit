//
//  Created by Daniel Pustotin on 23.12.2024
//

import SwiftUI

private struct PaddingsViewModifier: ViewModifier {
    let horizontal: CGFloat
    let vertical: CGFloat

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, horizontal)
            .padding(.vertical, vertical)
    }
}

public extension View {
    func padding(horizontal: CGFloat, vertical: CGFloat) -> some View {
        modifier(PaddingsViewModifier(horizontal: horizontal, vertical: vertical))
    }
}
