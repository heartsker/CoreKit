//
//  Created by Daniel Pustotin on 16.07.2023.
//

import Foundation

public extension JSONEncoder {
    /// Snake case encoder
    /// Encodes `"SomeInfoHere"` into `"some_info_here"`
    static let snakeCaseEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
}
