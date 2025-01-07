//
//  Created by Daniel Pustotin on 25.12.2024
//

import SwiftUI

public class Navigator: Codable, Equatable {
    // MARK: - Properties

    public var navigationPath = NavigationPath()

    // MARK: - Constructor

    public required convenience init(from decoder: any Decoder) throws {
        self.init()
    }

    public init() {}

    // MARK: - Methods

    public func encode(to encoder: any Encoder) throws {}

    public static func == (lhs: Navigator, rhs: Navigator) -> Bool {
        lhs.navigationPath == rhs.navigationPath
    }
}
