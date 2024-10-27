//
//  Created by Daniel Pustotin on 05.03.2023.
//

import UIKit

public extension UIApplication {
    /// Returns the key window of the application
    var currentKeyWindow: UIWindow? {
        // Get connected scenes
        connectedScenes
            .first { scene in
                // Keep only the first active `UIWindowScene`, onscreen and visible to user
                scene is UIWindowScene && scene.activationState == .foregroundActive
            }
            // Get its associated windows
            .flatMap { $0 as? UIWindowScene }?
            .windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}
