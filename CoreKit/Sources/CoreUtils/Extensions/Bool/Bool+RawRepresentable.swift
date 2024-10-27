//
//  Created by Daniel Pustotin on 04.11.2022.
//

extension Bool: RawRepresentable {
    // MARK: - Public nesting

    public typealias RawValue = String

    // MARK: - Public properties

    public var rawValue: String {
        self.description
    }

    // MARK: - Constructor

    public init?(rawValue: String) {
        guard [true.description, false.description].contains(rawValue) else {
            return nil
        }

        self = true.description == rawValue
    }
}
