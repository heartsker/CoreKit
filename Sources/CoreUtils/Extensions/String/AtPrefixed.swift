//
//  Created by Daniel Pustotin on 22.02.2023.
//

import Combine

public extension String {
    var atPrefixed: String {
        (isEmpty ? "" : "@") + self
    }
}
