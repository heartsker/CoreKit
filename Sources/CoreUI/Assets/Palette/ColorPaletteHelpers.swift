//
//  Created by Daniel Pustotin on 03.06.2024
//

import Logger
import SwiftUI

extension ColorPalette {
    // MARK: - Public methods

    /// Returns color in given bundle for color palette
    /// - Parameters:
    ///   - name: Name of the color
    /// - Returns: Resulting color
    static func color(_ name: String) -> Color {
        let color = Color(paletteName + name, bundle: .module)
        if color == .clear {
            logger.critical(
                "Color \(name) not found in \(paletteName) color palette",
                error: ColorPaletteError.colorNotFound(name: name, palette: paletteName)
            )
        }
        return color
    }

    /// Returns gradient in given bundle for color palette
    /// - Parameters:
    ///   - name: Name of the gradient colors
    /// - Returns: Resulting color
    static func gradient(_ name: String) -> Gradient {
        Gradient(
            colors: [
                color(name + ColorPaletteConst.gradientStartSuffix),
                color(name + ColorPaletteConst.gradientFinishSuffix)
            ]
        )
    }
}

// MARK: - Private nesting

private enum ColorPaletteConst {
    static let gradientStartSuffix = ".gradient.start"
    static let gradientFinishSuffix = ".gradient.finish"
}
