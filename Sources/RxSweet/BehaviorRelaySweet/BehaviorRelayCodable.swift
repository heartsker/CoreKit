//
//  Created by Daniel Pustotin on 14.08.2023.
//

extension BehaviorRelay: Codable where Element: Codable {
    public convenience init(from decoder: Decoder) throws {
        let value = try Element(from: decoder)
        self.init(value: value)
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
