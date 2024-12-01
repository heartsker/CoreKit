//
//  Created by Daniel Pustotin on 25.09.2023.
//

import CoreTypes
import SwiftUI

public struct AlertAction {
    // MARK: - Public properties

    static let cancel = Self(title: "Cancel", role: .cancel, action: nil)

    public let title: String
    public let role: ButtonRole?
    let action: VoidAction?

    // MARK: - Public methods

    public func perform() {
        action?()
    }
}
