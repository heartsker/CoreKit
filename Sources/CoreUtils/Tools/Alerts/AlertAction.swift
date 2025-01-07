//
//  Created by Daniel Pustotin on 25.09.2023.
//

import CoreTypes
import SwiftUI

public struct AlertAction: Sendable {
    // MARK: - Public properties

    static let cancel = Self(title: "Cancel", role: .cancel, action: {})

    public let title: String
    public let role: ButtonRole?
    private let action: SendableAction?

    // MARK: - Constructor

    public init(title: String, role: ButtonRole? = nil, action: SendableAction?) {
        self.title = title
        self.role = role
        self.action = action
    }

    // MARK: - Public methods

    public func perform() {
        action?()
    }
}
