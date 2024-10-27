//
//  Created by Daniel Pustotin on 30.10.2022.
//

public extension Set {
    /// Inverts the element's presents in the set.
    /// If set contains the element, it will be removed. If set doesn't contain the element, it will be added
    /// - Parameter element: Element to invert presence for
    mutating func invert(_ element: Element) {
        if contains(element) {
            remove(element)
        } else {
            insert(element)
        }
    }

    func inverted(_ element: Element) -> Set {
        var copy = self
        copy.invert(element)
        return copy
    }
}
