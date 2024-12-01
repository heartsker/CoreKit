//
//  Created by Daniel Pustotin on 03.06.2024
//

import SwiftUI

/// Protocol for background color palette
public protocol BackgroundColorPalette {
    /// Primary background color
    static var backgroundPrimary: Color { get }
    /// Secondary background color
    static var backgroundSecondary: Color { get }
    /// Tertiary background color
    static var backgroundTertiary: Color { get }
}
