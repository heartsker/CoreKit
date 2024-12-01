//
//  Created by Daniel Pustotin on 01.11.2022.
//

import SwiftUI

private struct KeyboardDismissingViewModifier: ViewModifier {
    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.dismissKeyboard()
            }
    }
}

public extension View {
    /// Dismisses keyboard on tap
    var keyboardDismissing: some View { // swiftlint:disable:this private_subviews swiftui_views_naming
        modifier(KeyboardDismissingViewModifier())
    }
}
