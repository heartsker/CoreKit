//
//  Created by Daniel Pustotin on 24.09.2023.
//

import CoreTypes
import SwiftUI

public struct Alert {
    // MARK: - Public properties

    public let title: String
    public let message: String?
    public let type: AlertType
    public let actions: [AlertAction]
}
