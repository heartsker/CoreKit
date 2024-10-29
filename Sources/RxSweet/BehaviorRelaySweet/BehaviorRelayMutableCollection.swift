//
//  Created by Daniel Pustotin on 23.11.2023.
//

public extension BehaviorRelay where Element: MutableCollection {
    // MARK: - Public methods

    subscript(_ index: Element.Index) -> Element.Element {
        get {
            value[index]
        }
        set {
            var copy = value
            copy[index] = newValue
            accept(copy)
        }
    }
}
