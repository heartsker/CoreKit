//
//  Created by Daniel Pustotin on 25.06.2023.
//

public extension Int {
    /// Returns a value bounded by the given lower and upper bounds
    /// - Parameters:
    ///   - lowerBound: Lower bound
    ///   - upperBound: Upper bound
    /// - Returns: Bounded value
    /// - Note: It's required for `upperBound` to be greater than or equal to `lowerBound`
    func bounded(_ lowerBound: Int, _ upperBound: Int) -> Int {
        precondition(
            lowerBound <= upperBound,
            "It's required for `upperBound` to be greater than or equal to `lowerBound`"
        )
        return Swift.min(upperBound, Swift.max(lowerBound, self))
    }
}
