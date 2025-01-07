//
//  Created by Daniel Pustotin on 23.12.2022.
//

import Foundation

public extension Double {
    /// Arithmetic rounded number
    var rounded: Int {
        Int(self + 0.5)
    }

    /// Rounding to the given number of decimal places
    /// - Parameter places: Number of decimal places
    /// - Returns: Rounded number
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }

    /// Rounding of the number to two decimal places
    /// - Parameters:
    ///  - places: Number of decimal places
    ///  - decimalSeparator: Decimal separator
    /// - Returns: String with rounded number without trailing zeros
    func roundedString(places: Int = 2, decimalSeparator: String = ",") -> String {
        let divisor = pow(10.0, Double(places))
        let rounded = (self * divisor + 0.5).rounded() / divisor
        let whole = Int(rounded)
        let fraction = Int(rounded * divisor) % Int(divisor)
        return String(whole) + (fraction == 0 ? "" : decimalSeparator + String(fraction))
    }
}
