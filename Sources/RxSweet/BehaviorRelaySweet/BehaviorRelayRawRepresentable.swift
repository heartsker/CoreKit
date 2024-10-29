//
//  Created by Daniel Pustotin on 13.08.2023.
//

extension BehaviorRelay: RawRepresentable where Element: RawRepresentable {
    // MARK: - Public properties

    public var rawValue: Element.RawValue {
        value.rawValue
    }

    // MARK: - Constructor

    public convenience init?(rawValue: Element.RawValue) {
        guard let value = Element(rawValue: rawValue) else {
            return nil
        }
        self.init(value: value)
    }
}
