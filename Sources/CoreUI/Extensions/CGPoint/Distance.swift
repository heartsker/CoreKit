//
//  Created by Daniel Pustotin on 24.07.2023.
//


public extension CGPoint {
    /// Calculates distance to given point
    /// - Parameter point: The point to calculate distance to
    /// - Returns: The distance between points
    func distance(to point: CGPoint) -> CGFloat {
        let dx = x - point.x
        let dy = y - point.y
        return sqrt(dx * dx + dy * dy)
    }
}
