//
//  Created by Daniel Pustotin on 13.03.2023.
//

import Foundation

/// JSON type with `String` keys
public typealias JSON = [String: Any]

public extension JSON {
    /// Creates new ``JSON`` instance from Encodable object
    /// - Parameter object: The object to encode
    /// - Note: Returns `nil` if encoding fails
    init?(_ object: Encodable) {
        guard let data = try? JSONEncoder.snakeCaseEncoder.encode(object) else {
            return nil
        }

        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
              let json = jsonObject as? JSON else {
            return nil
        }

        self = json
    }
}

public extension JSON {
    /// JSON representation of the object
    var prettyPrinted: String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted) else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
}
