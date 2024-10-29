//
//  Created by Daniel Pustotin on 27.12.2023.
//

extension Bool: Loggable {
    public var logDescription: String {
        description
    }
}
