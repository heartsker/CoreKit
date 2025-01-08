//
//  Created by Daniel Pustotin on 24.07.2023.
//

import CoreGraphics

public extension CGRect {
    /// The middle of the rect
    var middle: CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
