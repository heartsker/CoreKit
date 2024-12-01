//
//  Created by Daniel Pustotin on 14.01.2023.
//

import SwiftUI

/// Font style describes the text appearances
public struct FontStyle {
    // MARK: - Properties

    let size: FontSize
    let weight: Font.Weight
    private(set) var properties: FontProperties

    public var underlined: Self {
        with(.underlined)
    }

    public var italic: Self {
        with(.italic)
    }

    public var monospaced: Self {
        with(.monospaced)
    }

    public var strikethrough: Self {
        with(.strikethrough)
    }

    // MARK: - Constructor

    init(_ size: FontSize, weight: Font.Weight = .regular, properties: FontProperties = FontProperties()) {
        self.size = size
        self.weight = weight
        self.properties = properties
    }

    // MARK: - Public methods

    public static func ofSize(_ size: FontSize) -> Self {
        Self(size)
    }

    // MARK: - Private methods

    private func with(_ properties: FontProperties) -> Self {
        Self(size, weight: weight, properties: self.properties.union(properties))
    }
}
