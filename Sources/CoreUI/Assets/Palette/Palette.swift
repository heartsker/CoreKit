//
//  Created by Daniel Pustotin on 01.06.2022.
//

import SwiftUI

/// App color palette
public enum Palette {
    // MARK: - Public properties

    public static var paletteName: String {
        paletteType.rawValue
    }

    // MARK: - Public methods

    static func setPaletteType(with paletteType: ColorPaletteType) {
        self.paletteType = paletteType
    }

    // MARK: - Private properties

    static var paletteType: ColorPaletteType = .default
}

extension Palette: ColorPalette {}
