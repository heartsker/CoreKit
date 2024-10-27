//
//  Created by Daniel Pustotin on 04.12.2022.
//

public extension Double {
    /// Returns a value bounded by the given lower and upper bounds
    /// - Parameters:
    ///   - lowerBound: Lower bound
    ///   - upperBound: Upper bound
    /// - Returns: Bounded value
    /// - Note: It's required for `upperBound` to be greater than or equal to `lowerBound`
    func bounded(_ lowerBound: Double, _ upperBound: Double) -> Double {
        precondition(
            lowerBound.isLessThanOrEqualTo(upperBound),
            "It's required for `upperBound` to be greater than or equal to `lowerBound`"
        )
        return min(upperBound, max(lowerBound, self))
    }

    /// Returns a value bounded by zero to one `(0.0...1.0)` range
    var zeroOneBounded: Double {
        bounded(0.0, 1.0)
    }

    /// Returns a value mathematically bounded by zero to one `(0.0...1.0)` range with precision of 0.05
    var zeroOneMathBounded: Double {
        let precision = 0.05
        let mathRounded = Double(Int((self + precision / 2) / precision)) * precision
        return mathRounded.bounded(0.0, 1.0)
    }
}
