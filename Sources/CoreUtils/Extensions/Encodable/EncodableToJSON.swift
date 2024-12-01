//
//  Created by Daniel Pustotin on 12.11.2022.
//

import Foundation

public extension Encodable {
    /// Encodes the object to a JSON object
    /// - Parameter encoder: JSON encoder to be used. Default value is `JSONEncoder()`
    /// - Returns: JSON object as `Any`
    func toJSON(with encoder: JSONEncoder = JSONEncoder()) throws -> Any {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(
                codingPath: [],
                debugDescription: "Deserialized object is not a JSON"
            )
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json as Any
    }
}
