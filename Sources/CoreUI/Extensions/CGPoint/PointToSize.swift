//
//  Created by Daniel Pustotin on 28.07.2023.
//

import Foundation

public extension CGPoint {
    /// Size with corresponding values of `width` and `height`
    var size: CGSize {
        CGSize(width: x, height: y)
    }
}
