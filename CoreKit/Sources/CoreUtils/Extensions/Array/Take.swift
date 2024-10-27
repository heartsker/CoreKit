//
//  Created by Daniel Pustotin on 27.10.2023.
//

public extension Array {
    func takeFirst(_ number: Int) -> Self {
        let toDrop = Swift.max(count - number, 0)
        return dropLast(toDrop)
    }

    func takeLast(_ number: Int) -> Self {
        let toDrop = Swift.max(count - number, 0)
        return Self(dropFirst(toDrop))
    }
}
