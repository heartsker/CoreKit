//
//  Created by Daniel Pustotin on 02.09.2022.
//

public extension Array {
    /// Fills the array with a given value
    /// - Parameters:
    ///   - value: Value to fill the array with
    ///   - count: Number of elements to fill the array with. If `nil`, the array will be filled with the given value
    mutating func fill(with value: Element, count: Int? = nil) {
        self = Array(repeating: value, count: count ?? self.count)
    }
}
