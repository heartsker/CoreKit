//
//  Created by Daniel Pustotin on 28.07.2023.
//

import Foundation

public extension CGPoint {
    /// Creates point with same `x` and `y` values
    init(identical value: CGFloat) {
        self.init(x: value, y: value)
    }
}
