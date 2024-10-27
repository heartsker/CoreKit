//
//  Created by Daniel Pustotin on 07.08.2024.
//

public enum PropertyListKey {
    case buildConfiguration
    case other(key: String)

    // MARK: - Public properties

    var key: String {
        switch self {
        case let .other(key): key
        default: String(describing: self).camelCaseToUpperCaseSnakeCase
        }
    }
}
