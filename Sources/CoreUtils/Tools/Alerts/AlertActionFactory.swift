//
//  Created by Daniel Pustotin on 25.09.2023.
//

import CoreTypes
import SwiftUI

public enum AlertActionFactory {
    // swiftlint:disable:next function_default_parameter_at_end
    public static func make(
        with title: String,
        role: ButtonRole? = nil,
        onTriggered action: VoidAction?
    ) -> AlertAction {
        AlertAction(title: title, role: role, action: action)
    }
}
