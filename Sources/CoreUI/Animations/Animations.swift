//
//  Created by Daniel Pustotin on 26.06.2022.
//

import SwiftUI

public extension Animation {
    /// Opening animation using spring
    static let open = Animation.spring(response: 0.3, dampingFraction: 0.9, blendDuration: 0.2)

    /// Closing animation using spring
    static let close = Animation.spring(response: 0.4, dampingFraction: 0.9, blendDuration: 0.2)

    /// Flipping animation using spring
    static let flip = Animation.spring(response: 0.35, dampingFraction: 0.7, blendDuration: 0.2)

    /// Fast opening animation using ease out
    static let fastOpen = Animation.easeOut(duration: 0.2)

    /// Fast closing animation using ease in
    static let fastClose = Animation.easeIn(duration: 0.2)

    /// Fast fade animation using ease in out
    static let fastFade = Animation.easeInOut(duration: 0.2)

    /// Slide animation using spring
    static let slide = Animation.interactiveSpring(response: 0.35, dampingFraction: 0.7)

    /// Toggle animation
    static let toggle = Animation.spring(response: 0.3, dampingFraction: 0.8, blendDuration: 0.3)
}
