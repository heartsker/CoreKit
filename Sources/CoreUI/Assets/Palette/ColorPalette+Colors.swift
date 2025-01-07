//
//  Created by Daniel Pustotin on 03.06.2024
//

import SwiftUI

public extension ColorPalette {
    // MARK: - Public properties

    // MARK: Background

    static var backgroundPrimary: Color { color("background-primary") }
    static var backgroundSecondary: Color { color("background-secondary") }
    static var backgroundTertiary: Color { color("background-tertiary") }

    // MARK: Brand

    static var accent: Color { color("accent") }

    // MARK: - Common

    static var shadow: Color { color("shadow") }

    // MARK: Graphics

    static var graphicsPrimary: Color { color("graphics-primary") }
    static var graphicsSecondary: Color { color("graphics-secondary") }

    // MARK: - Static

    static var staticTextBlack: Color { color("static-text-black") }
    static var staticTextWhite: Color { color("static-text-white") }

    static var staticBlue: Color { color("static-blue") }
    static var staticRed: Color { color("static-red") }
    static var staticGreen: Color { color("static-green") }
    static var staticYellow: Color { color("static-yellow") }
    static var staticPurple: Color { color("static-purple") }
    static var staticPink: Color { color("static-pink") }

    static var staticGray1: Color { color("static-gray1") }
    static var staticGray2: Color { color("static-gray2") }
    static var staticGray3: Color { color("static-gray3") }
    static var staticGray4: Color { color("static-gray4") }
    static var staticGray5: Color { color("static-gray5") }
    static var staticGray6: Color { color("static-gray6") }
    static var staticGray7: Color { color("static-gray7") }
    static var staticGray8: Color { color("static-gray8") }
    static var staticGray9: Color { color("static-gray9") }

    // MARK: Text

    static var textPrimary: Color { color("text-primary") }
    static var textSecondary: Color { color("text-secondary") }
    static var textTertiary: Color { color("text-tertiary") }
    static var textLink: Color { color("text-link") }
}
