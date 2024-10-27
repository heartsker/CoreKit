//
//  Created by Daniel Pustotin on 23.07.2023.
//

public extension MutableCollection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index?) -> Element? {
        get {
            if let index, indices.contains(index) {
                return self[index]
            }
            return nil
        }
        set(newValue) {
            if let index, indices.contains(index), let newValue {
                self[index] = newValue
            }
        }
    }
}
