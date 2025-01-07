//
//  Created by Daniel Pustotin on 25.12.2023.
//

extension BehaviorRelay: Togglable where Element: Togglable {
    // MARK: - Public properties

    public var toggled: BehaviorRelay<Element> {
        BehaviorRelay(value: value.toggled)
    }

    // MARK: - Public methods

    public func toggle() {
        accept(value.toggled)
    }
}
