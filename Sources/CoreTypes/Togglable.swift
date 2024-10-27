//
//  Created by Daniel Pustotin on 27.12.2023.
//

/// Type that can be toggled
public protocol Togglable {
    // MARK: - Public properties

    /// Toggled value
    var toggled: Self { get }
}

public extension Togglable {
    mutating func toggle() {
        self = toggled
    }
}
