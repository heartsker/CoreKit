//
//  Created by Daniel Pustotin on 14.01.2023.
//

import SwiftUI

public extension Font {
    // MARK: - Constructor

    init(_ size: FontSize, weight: Font.Weight = .regular) {
        self = .system(size: size.rawValue, weight: weight)
    }

    init(fontStyle: FontStyle) {
        switch fontStyle.properties {
        case .monospaced:
            self = .system(size: fontStyle.size.rawValue, weight: fontStyle.weight, design: .monospaced)

        default:
            self = .system(size: fontStyle.size.rawValue, weight: fontStyle.weight)
        }
    }

    // MARK: - Public methods

    /// Creates light font with specified size
    static func light(size: FontSize) -> Font {
        Font(size, weight: .light)
    }

    /// Creates regular font with specified size
    static func regular(size: FontSize) -> Font {
        Font(size, weight: .regular)
    }

    /// Creates semibold font with specified size
    static func semibold(size: FontSize) -> Font {
        Font(size, weight: .semibold)
    }

    /// Creates bold font with specified size
    static func bold(size: FontSize) -> Font {
        Font(size, weight: .bold)
    }
}
