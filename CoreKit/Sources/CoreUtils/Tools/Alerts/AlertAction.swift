//
//  Created by Daniel Pustotin on 25.09.2023.
//

import CoreTypes
import SwiftUI

public struct AlertAction {
    // MARK: - Public properties

    public let title: String
    public let role: ButtonRole?
    let action: VoidAction?

    // MARK: - Public methods

    public func perform() {
        action?()
    }
}
