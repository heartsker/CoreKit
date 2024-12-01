//
//  Created by Daniel Pustotin on 09.12.2022.
//

import SwiftUI

public extension Angle {
    /// Angle of 90 degrees
    static let right = Angle(degrees: 90.0)
    /// Angle of -90 degrees
    static let rightCCW = right.counterclockwise

    /// Angle of 180 degrees
    static let straight = Angle(degrees: 180.0)
    /// Angle of -180 degrees
    static let straightCCW = straight.counterclockwise

    /// Angle of 360 degrees
    static let full = Angle(degrees: 360.0)
    /// Angle of -360 degrees
    static let fullCCW = full.counterclockwise

    /// Returns the opposite (or counterclockwise) angle
    var counterclockwise: Angle {
        Angle(radians: -radians)
    }
}
