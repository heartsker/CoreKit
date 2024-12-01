//
//  Created by Daniel Pustotin on 29.06.2023.
//

import SwiftUI

public extension Color {
    /// All system colors
    static let allColors: [Color] = [
        .black,
        .blue,
        .brown,
        .cyan,
        .gray,
        .green,
        .indigo,
        .mint,
        .orange,
        .pink,
        .purple,
        .red,
        .teal,
        .teal,
        .white,
        .yellow
    ]

    /// Random system color
    static var random: Color {
        allColors.randomElement() ?? .black
    }
}
