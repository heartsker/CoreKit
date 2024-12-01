//
//  Created by Daniel Pustotin on 03.06.2024
//

import SwiftUI

public protocol ColorPalette:
    BackgroundColorPalette,
    BrandColorPalette,
    CommonColorPalette,
    ForegroundColorPalette,
    GraphicsColorPalette,
    PracticeResultColorPalette,
    SignInMethodColorPalette,
    TabBarColorPalette {
    static var paletteName: String { get }
}

public extension ColorPalette {
    // MARK: - Public properties

    // MARK: Background

    static var backgroundPrimary: Color { color("background.primary") }
    static var backgroundSecondary: Color { color("background.secondary") }
    static var backgroundTertiary: Color { color("background.tertiary") }

    // MARK: Brand

    static var brandAccent: Color { color("brand.accent") }
    static var brandGradient: Gradient { gradient("brand") }
    static var brandGradientSecondary: Gradient { gradient("brand.secondary") }

    // MARK: Code

    static var codeBackground: Color { color("code.background") }
    static var codeComment: Color { color("code.comment") }
    static var codeCommonType: Color { color("code.common.type") }
    static var codeDeclaration: Color { color("code.declaration") }
    static var codeDeclarationType: Color { color("code.declaration.type") }
    static var codeField: Color { color("code.field") }
    static var codeGlobalFunction: Color { color("code.global.function") }
    static var codeKeyword: Color { color("code.keyword") }
    static var codeMethodOrProperty: Color { color("code.method.or.property") }
    static var codeNumber: Color { color("code.number") }
    static var codeOperator: Color { color("code.operator") }
    static var codeParameter: Color { color("code.parameter") }
    static var codePlain: Color { color("code.plain") }
    static var codeProjectType: Color { color("code.project.type") }
    static var codePropertyWrapper: Color { color("code.property.wrapper") }
    static var codeString: Color { color("code.string") }

    // MARK: Common

    static var commonError: Color { color("common.error") }
    static var commonError30: Color { color("common.error.30") }
    static var commonLike: Color { color("common.like") }
    static var commonShadow: Color { color("common.shadow") }
    static var commonSuccess: Color { color("common.success") }
    static var commonClearToBlackGradient: Gradient { gradient("common.clear.to.black") }

    // MARK: Foreground

    static var foregroundPrimary: Color { color("foreground.primary") }
    static var foregroundSecondary: Color { color("foreground.secondary") }
    static var foregroundTertiary: Color { color("foreground.tertiary") }
    static var foregroundPrimaryReversed: Color { color("foreground.primary.reversed") }
    static var foregroundPrimaryWhite: Color { color("foreground.primary.white") }
    static var foregroundPrimaryWhite70: Color { color("foreground.primary.white.70") }
    static var foregroundOverlay: Color { color("foreground.overlay") }
    static var foregroundDifference: Color { color("foreground.difference") }

    // MARK: Graphics

    static var graphicsPrimary: Color { color("graphics.primary") }
    static var graphicsSecondary: Color { color("graphics.secondary") }
}
