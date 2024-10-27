//
//  Created by Daniel Pustotin on 27.12.2023.
//

extension Bool: Togglable {
    // MARK: - Public properties

    public var toggled: Bool {
        !self
    }
}
