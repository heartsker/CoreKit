//
//  Created by Daniel Pustotin on 14.11.2022.
//

import Foundation

extension Dictionary: RawRepresentable where Key: Codable, Value: Codable {
    public init?(rawValue: RawValue) {
        guard let data = rawValue?.data(using: .utf8),
              let dict = try? JSONDecoder().decode(Self.self, from: data) else {
            return nil
        }
        self = dict
    }

    public var rawValue: RawValue {
        guard let jsonObject = try? self.toJSON(),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject) else {
            return nil
        }
        return String(data: jsonData, encoding: .utf8)
    }

    public typealias RawValue = String?
}
