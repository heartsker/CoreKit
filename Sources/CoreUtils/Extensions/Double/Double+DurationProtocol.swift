//
//  Created by Daniel Pustotin on 05.12.2022.
//

extension Double: @retroactive DurationProtocol {
    public static func / (lhs: Double, rhs: Int) -> Double {
        lhs / Double(rhs)
    }

    public static func * (lhs: Double, rhs: Int) -> Double {
        lhs * Double(rhs)
    }
}
