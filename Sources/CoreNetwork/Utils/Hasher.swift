//
//  Created by Daniel Pustotin on 07.05.2024
//

import CryptoKit
import Foundation

public enum Hasher {
    public static func hash(_ string: String) -> String {
        hash(data: Data(string.utf8))
    }

    public static func hash(data: Data) -> String {
        SHA256.hash(data: data).string
    }
}

private extension Digest {
    var string: String {
        compactMap { byte in
            String(format: "%02x", byte)
        }
        .joined()
    }
}
