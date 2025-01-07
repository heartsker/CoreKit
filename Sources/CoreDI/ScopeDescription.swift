//
//  Created by Daniel Pustotin on 29.11.2023.
//

public extension Scope {
    var description: String {
        path[1...].joined(separator: "->")
    }
}
