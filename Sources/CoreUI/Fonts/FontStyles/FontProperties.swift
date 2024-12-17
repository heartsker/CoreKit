//
//  Created by Daniel Pustotin on 02.06.2024
//

public struct FontProperties: OptionSet, Sendable {
    // MARK: - Public properties

    public static let underlined = Self(rawValue: 1 << 0)
    public static let italic = Self(rawValue: 1 << 1)
    public static let monospaced = Self(rawValue: 1 << 2)
    public static let strikethrough = Self(rawValue: 1 << 3)

    public let rawValue: Int

    // MARK: - Constructor

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
