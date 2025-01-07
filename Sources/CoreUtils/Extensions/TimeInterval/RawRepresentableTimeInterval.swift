//
//  Created by Daniel Pustotin on 14.11.2022.
//

import Foundation

extension TimeInterval: @retroactive RawRepresentable {
    // MARK: - Public nesting
    public typealias RawValue = String

    // MARK: - Public properties

    public var rawValue: String {
        description
    }

    // MARK: - Constructor

    public init?(rawValue: String) {
        guard let value = Double(rawValue) else {
            return nil
        }
        self = value
    }
}
