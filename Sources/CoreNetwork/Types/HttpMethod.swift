//
//  Created by Daniel Pustotin on 12.03.2023.
//

public enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

public extension HttpMethod {
    /// Compares `String?` with `HttpMethod`
    /// - Parameters:
    ///   - lhs: `String?`
    ///   - rhs: `HttpMethod`
    /// - Returns: `true` if HTTP methods are equal, `false` otherwise
    static func == (lhs: String?, rhs: HttpMethod) -> Bool {
        lhs == rhs.rawValue
    }

    static func != (lhs: String?, rhs: HttpMethod) -> Bool {
        lhs != rhs.rawValue
    }
}

extension HttpMethod: Loggable {
    public var logDescription: String {
        rawValue
    }
}
