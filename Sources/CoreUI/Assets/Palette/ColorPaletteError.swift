//
//  Created by Daniel Pustotin on 20.07.2024
//

enum ColorPaletteError: CommonError {
    case colorNotFound(name: String, palette: String)

    var errorDescription: String {
        switch self {
        case let .colorNotFound(name, palette):
            "Color \(name) not found in \(palette) color palette"
        }
    }
}
