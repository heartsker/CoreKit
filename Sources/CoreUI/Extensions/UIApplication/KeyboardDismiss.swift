//
//  Created by Daniel Pustotin on 01.11.2022.
//

import SwiftUI

public extension UIApplication {
    /// Dismisses the keyboard
    static func dismissKeyboard() {
        withAnimation(.fastClose) {
            _ = UIApplication.shared.connectedScenes
                .filter { scene in scene.activationState == .foregroundActive }
                .map { scene in scene as? UIWindowScene }
                .compactMap { $0 }
                .first?.windows
                .first { window in window.isKeyWindow }?
                .endEditing(true)
        }
    }
}
