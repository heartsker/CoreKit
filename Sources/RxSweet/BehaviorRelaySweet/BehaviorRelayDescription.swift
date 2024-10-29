//
//  Created by Daniel Pustotin on 11.08.2023.
//

extension BehaviorRelay: CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        value.description
    }
}
