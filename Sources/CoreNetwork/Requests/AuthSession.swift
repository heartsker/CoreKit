//
//  Created by Daniel Pustotin on 26.02.2024.
//

import CoreTypes

public struct AuthSession: Codable {
    // MARK: - Public properties

    public let token: UID

    public init(token: UID) {
        self.token = token
    }
}
