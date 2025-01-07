//
//  Created by Daniel Pustotin on 11.08.2023.
//

extension BehaviorRelay: @retroactive CustomStringConvertible where Element: CustomStringConvertible {
    public var description: String {
        value.description
    }
}
