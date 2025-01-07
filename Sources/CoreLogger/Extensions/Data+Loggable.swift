//
//  Created by Daniel Pustotin on 04.01.2023.
//

import Foundation

extension Data: Loggable {
    public var logDescription: String {
        if let string = String(data: self, encoding: .utf8) {
            return "Data: \n" + string
        }
        return "`raw data`, size: [" + ByteCountFormatter().string(fromByteCount: Int64(count)) + "]"
    }
}
