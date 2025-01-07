//
//  Created by Daniel Pustotin on 11.08.2023.
//

public extension BehaviorRelay where Element: Collection {
    // MARK: - Public properties

    var isEmpty: Bool {
        value.isEmpty
    }
}
