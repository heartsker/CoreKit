//
//  Created by Daniel Pustotin on 03.06.2024
//

import SwiftUI

/// Foreground color palette
public protocol ForegroundColorPalette {
    // MARK: - Public properties

    /// Primary foreground color
    static var foregroundPrimary: Color { get }
    /// Secondary foreground color
    static var foregroundSecondary: Color { get }
    /// Tertiary foreground color
    static var foregroundTertiary: Color { get }

    /// Reversed primary foreground color
    static var foregroundPrimaryReversed: Color { get }

    /// Primary white foreground color
    static var foregroundPrimaryWhite: Color { get }

    /// Primary white foreground color (70%)
    static var foregroundPrimaryWhite70: Color { get }

    /// Foreground color for overlay blend mode
    static var foregroundOverlay: Color { get }

    /// Foreground color for difference blend mode
    static var foregroundDifference: Color { get }
}
