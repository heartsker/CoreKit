//
//  Created by Daniel Pustotin on 30.07.2022.
//

import CoreUtils
import SwiftUI

private struct AdaptiveBlendModeViewModifier: ViewModifier {
    // MARK: - Public properties

    @Environment(\.colorScheme)
    private var colorScheme

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .blendMode(colorScheme.isLight ? .darken : .lighten)
    }
}

public extension View {
    /// Applies adaptive blend mode to the view
    var adaptiveBlendMode: some View {  // swiftlint:disable:this swiftui_views_naming private_subviews
        modifier(AdaptiveBlendModeViewModifier())
    }
}
