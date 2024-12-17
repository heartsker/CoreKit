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
        case Color.gray.description: .gray
        case Color.brown.description: .brown
        case Color.orange.description: .orange
        case Color.yellow.description: .yellow
        case Color.green.description: .green
        case Color.blue.description: .blue
        case Color.purple.description: .purple
        case Color.pink.description: .pink
        case Color.red.description: .red
        default: .clear
        }
    }
}
