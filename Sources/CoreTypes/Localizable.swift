//
//  Created by Daniel Pustotin on 24.12.2024
//

public protocol Localizable {
    var localizedName: String { get }
}

public extension CustomStringConvertible where Self: Localizable {
    var description: String {
        localizedName
    }
}
