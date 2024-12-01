//
//  Created by Daniel Pustotin on 18.02.2023.
//

import SwiftUI

private struct MatchedGlassViewModifier: ViewModifier {
    // MARK: - Public properties

    var cornerRadius: CGFloat
    var id: String
    var ns: Namespace.ID

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.thinMaterial)
                    .match(id, in: ns)
            }
            .compositingGroup()
    }
}

public extension View {
    /// Applies matched glass to the view
    /// - Parameters:
    ///   - cornerRadius: Corner radius of the glass
    ///   - id: id to match
    ///   - ns: Geometry namespace
    /// - Returns: Modified view
    func matchedGlass( // swiftlint:disable:this function_default_parameter_at_end
        cornerRadius: CGFloat = Spacing.l,
        id: String,
        ns: Namespace.ID
    ) -> some View {
        self.modifier(MatchedGlassViewModifier(cornerRadius: cornerRadius, id: id, ns: ns))
    }
}
