//
//  Created by Daniel Pustotin on 20.06.2022.
//

import SwiftUI

public extension Palette {
    /// Standard color
    /// - Parameter name: Color name
    /// - Returns: Color
    static func standard(_ name: String) -> Color {
        switch name {
        case Color.gray.description:
            return .gray

        case Color.brown.description:
            return .brown

        case Color.orange.description:
            return .orange

        case Color.yellow.description:
            return .yellow

        case Color.green.description:
            return .green

        case Color.blue.description:
            return .blue

        case Color.purple.description:
            return .purple

        case Color.pink.description:
            return .pink

        case Color.red.description:
            return .red
        case "default":
            return foregroundPrimary

        default:
            return .clear
        }
    }
}
