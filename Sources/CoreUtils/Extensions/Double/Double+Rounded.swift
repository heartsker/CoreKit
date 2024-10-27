//
//  Created by Daniel Pustotin on 23.12.2022.
//

public extension Double {
    /// Arithmetic rounded number
    var rounded: Int {
        Int(self + 0.5)
    }
}
