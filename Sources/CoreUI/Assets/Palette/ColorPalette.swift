//
//  Created by Daniel Pustotin on 16.12.2024
//

import SwiftUI

public protocol ColorPalette {
    static var paletteName: String { get }

    // MARK: - Background

    /// Primary background color
    static var backgroundPrimary: Color { get }
    /// Secondary background color
    static var backgroundSecondary: Color { get }
    /// Tertiary background color
    static var backgroundTertiary: Color { get }
    /// Primary background color for grouped content
    static var backgroundGroupedPrimary: Color { get }
    /// Secondary background color for grouped content
    static var backgroundGroupedSecondary: Color { get }
    /// Tertiary background color for grouped content
    static var backgroundGroupedTertiary: Color { get }

    /// Primary background color for combined grouped content
    static var backgroundGroupedCombinedPrimary: Color { get }
    /// Secondary background color for combined grouped content
    static var backgroundGroupedCombinedSecondary: Color { get }
    /// Tertiary background color for combined grouped content
    static var backgroundGroupedCombinedTertiary: Color { get }

    // MARK: - Brand

    /// Accent color
    static var accent: Color { get }

    // MARK: - Common

    /// Shadow color
    static var shadow: Color { get }

    // MARK: - Graphics

    /// Primary graphics color
    static var graphicsPrimary: Color { get }
    /// Secondary graphics color
    static var graphicsSecondary: Color { get }

    // MARK: - Static

    /// Static black text color
    static var staticTextBlack: Color { get }
    /// Static white text color
    static var staticTextWhite: Color { get }

    /// Static blue color
    static var staticBlue: Color { get }
    /// Static red color
    static var staticRed: Color { get }
    /// Static green color
    static var staticGreen: Color { get }
    /// Static yellow color
    static var staticYellow: Color { get }
    /// Static purple color
    static var staticPurple: Color { get }
    /// Static pink color
    static var staticPink: Color { get }

    /// Static gray (shade 1) color
    static var staticGray1: Color { get }
    /// Static gray (shade 2) color
    static var staticGray2: Color { get }
    /// Static gray (shade 3) color
    static var staticGray3: Color { get }
    /// Static gray (shade 4) color
    static var staticGray4: Color { get }
    /// Static gray (shade 5) color
    static var staticGray5: Color { get }
    /// Static gray (shade 6) color
    static var staticGray6: Color { get }
    /// Static gray (shade 7) color
    static var staticGray7: Color { get }
    /// Static gray (shade 8) color
    static var staticGray8: Color { get }
    /// Static gray (shade 9) color
    static var staticGray9: Color { get }

    // MARK: - Text

    /// Primary text color
    static var textPrimary: Color { get }
    /// Secondary text color
    static var textSecondary: Color { get }
    /// Tertiary text color
    static var textTertiary: Color { get }
    /// Quaternary text color
    static var textQuaternary: Color { get }
    /// Link text color
    static var textLink: Color { get }
}
