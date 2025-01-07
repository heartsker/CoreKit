//
//  Created by Daniel Pustotin on 06.06.2022.
//

import SwiftUI

public extension ColorScheme {
    // MARK: - Constructor

    /// Creates a color scheme
    /// - Parameter isLight: `true` if the color scheme is light, `false` if it is dark
    init(isLight: Bool) {
        self = isLight ? .light : .dark
    }

    /// Creates a light color scheme
    init() {
        self = .light
    }

    // MARK: - Public properties

    /// `true` if the color scheme is light, `false` if it is dark
    var isLight: Bool {
        !isDark
    }

    /// `true` if the color scheme is dark, `false` if it is light
    var isDark: Bool {
        self == .dark
    }

    /// Opposite color scheme. If the color scheme is light, returns dark, and vice versa
    var opposite: ColorScheme {
        isDark ? .light : .dark
    }

    // MARK: - Public methods

    /// Toggles the color scheme. Light becomes dark, and vice versa
    mutating func toggle() {
        self = opposite
    }
}

extension ColorScheme: @retroactive RawRepresentable {
    public typealias RawValue = String

    public init?(rawValue: String) {
        self.init(isLight: rawValue != "dark")
    }

    public var rawValue: String {
        isDark ? "dark" : "light"
    }
}

extension ColorScheme: Codable {}
