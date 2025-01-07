//
//  Created by Daniel Pustotin on 03.06.2024
//

import CoreLogger
import SwiftUI

public extension ColorPalette {
    // MARK: - Public methods

    /// Returns color in given bundle for color palette
    /// - Parameters:
    ///   - name: Name of the color
    ///   - bundle: Bundle where color is located, default is `.module`
    /// - Returns: Resulting color
    static func color(
        _ name: String,
        bundle: Bundle? = nil
    ) -> Color {
        let palettePrefix = paletteName + (paletteName.isEmpty ? "" : "-")
        return Color(palettePrefix + name, bundle: bundle ?? .module)
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
    static let gradientStartSuffix = "-gradient-start"
    static let gradientFinishSuffix = "-gradient-finish"
}
