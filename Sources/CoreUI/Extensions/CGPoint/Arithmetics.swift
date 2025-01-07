//
//  Created by Daniel Pustotin on 24.07.2023.
//


public extension CGPoint {
    /// Adds two points as vectors
    /// - Parameters:
    ///   - lhs: First point
    ///   - rhs: Second point
    /// - Returns: The resulting point vector
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    /// Subtracts two points as vectors
    /// - Parameters:
    ///   - lhs: First point
    ///   - rhs: Second point
    /// - Returns: The resulting point vector
    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    /// Multiplies point by a scalar as vector
    /// - Parameters:
    ///   - lhs: The point
    ///   - rhs: The scalar to multiply by
    /// - Returns: The resulting point vector
    static func * (lhs: CGPoint, rhs: Double) -> CGPoint {
        CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }

    /// Divides point by a scalar as vector
    /// - Parameters:
    ///   - lhs: The point
    ///   - rhs: The scalar to divide by
    /// - Returns: The resulting point vector
    static func / (lhs: CGPoint, rhs: Double) -> CGPoint {
        lhs * (1 / rhs)
    }

    /// Negates the point over point `(0, 0)`
    /// - Parameter point: The point to negate
    /// - Returns: The resulting point
    static prefix func - (_ point: CGPoint) -> CGPoint {
        CGPoint(x: -point.x, y: -point.y)
    }
}
