//
//  Created by Daniel Pustotin on 07.08.2024.
//

import CoreTypes

final class ConfigurableMock: Configurable {
    // MARK: - Public properties

    var value: String

    // MARK: - Constructor

    init(value: String = String()) {
        self.value = value
    }
}
