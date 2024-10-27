//
//  Created by Daniel Pustotin on 01.10.2022.
//

import Darwin

public extension Double {
    // MARK: - Public nesting

    /// Proportion multiplier kind
    enum MultiplierKind {
        /// Constant multiplier
        case constant(_ constant: Double)
        /// Linear multiplier
        case linear(multiplier: Double)
        /// Exponential multiplier
        case exponential
        /// Logarithmic multiplier
        case logarithmic
    }

    /// Calculates a value proportional to the given value
    /// - Parameters:
    ///   - lowerBound: Lower bound of the result
    ///   - normal: Normal value of the result
    ///   - upperBound: Upper bound of the result
    ///   - negativeMultiplier: Multiplier kind for negative values
    ///   - positiveMultiplier: Multiplier kind for positive values
    ///   - value: Value to calculate the result for
    static func proportional( // swiftlint:disable:this function_parameter_count
        lowerBound: Double,
        normal: Double,
        upperBound: Double,
        negativeMultiplier: MultiplierKind,
        positiveMultiplier: MultiplierKind,
        value: Double
    ) -> Double {
        let diff: Double

        if value.isZero {
            return normal
        }

        switch value < 0 ? negativeMultiplier : positiveMultiplier {
        case .constant(let constant):
            diff = constant

        case .linear(let multiplier):
            diff = multiplier * value

        case .exponential:
            diff = exp(abs(value)) * (value < 0 ? -1 : 1)

        case .logarithmic:
            diff = log(abs(value)) * (value < 0 ? -1 : 1)
        }

        return Double(diff + normal).bounded(lowerBound, upperBound)
    }
}
