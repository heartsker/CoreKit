//
//  Created by Daniel Pustotin on 26.02.2024.
//

import CoreTypes
import Foundation

public extension JSON {
    // MARK: - Public properties

    var encoded: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted, .sortedKeys])
    }

    // MARK: - Constructor

    init?(from object: Encodable) {
        guard let data = try? JSONEncoder.snakeCaseEncoder.encode(object),
              let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .topLevelDictionaryAssumed),
              let json = jsonObject as? JSON else {
            return nil
        }

        self = json
    }
}
