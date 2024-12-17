//
//  Created by Daniel Pustotin on 03.06.2024
//

public extension ColorPalette {
    // MARK: - Public properties

    // MARK: Background

    static var backgroundPrimary: Color { color("background.primary") }
    static var backgroundSecondary: Color { color("background.secondary") }
    static var backgroundTertiary: Color { color("background.tertiary") }

    // MARK: Brand

    static var accent: Color { color("accent") }

    // MARK: - Common

    static var shadow: Color { color("shadow") }

    // MARK: Graphics

    static var graphicsPrimary: Color { color("graphics.primary") }
    static var graphicsSecondary: Color { color("graphics.secondary") }

    // MARK: Text

    static var textPrimary: Color { color("text.primary") }
    static var textSecondary: Color { color("text.secondary") }
    static var textTertiary: Color { color("text.tertiary") }
}
