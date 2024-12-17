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

    // MARK: - Text

    /// Primary text color
    static var textPrimary: Color { get }
    /// Secondary text color
    static var textSecondary: Color { get }
    /// Tertiary text color
    static var textTertiary: Color { get }
}
