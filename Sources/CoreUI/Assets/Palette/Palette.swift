//
//  Created by Daniel Pustotin on 01.06.2022.
//


/// App color palette
public enum Palette: Sendable {
    // MARK: - Public properties

    public static var paletteName: String {
        paletteType.rawValue
    }

    // MARK: - Private properties

    private static let paletteType: ColorPaletteType = .default
}

extension Palette: ColorPalette {}
