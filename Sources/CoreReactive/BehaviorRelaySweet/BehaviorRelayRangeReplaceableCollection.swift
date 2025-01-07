//
//  Created by Daniel Pustotin on 23.11.2023.
//

public extension BehaviorRelay where Element: RangeReplaceableCollection {
    // MARK: - Public methods

    func append(_ element: Element.Element) {
        var newValue = value
        newValue.append(element)
        accept(newValue)
    }
}
