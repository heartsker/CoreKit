//
//  Created by Daniel Pustotin on 13.07.2023.
//

extension Int: @retroactive RawRepresentable {
    // MARK: - Public nesting

    public typealias RawValue = String

    // MARK: - Public properties

    public var rawValue: String {
        self.description
    }

    // MARK: - Constructor

    public init?(rawValue: String) {
        guard let number = Int(rawValue) else {
            return nil
        }

        self = number
    }
}
