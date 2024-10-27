//
//  Created by Daniel Pustotin on 09.07.2022.
//

public extension Collection {
    /// Returns an enumerated array from the collection as an array of tuples with an offset and an element
    /// - Returns: Enumerated array
    func enumeratedArray() -> [(offset: Int, element: Self.Element)] {
        Array(self.enumerated())
    }
}
