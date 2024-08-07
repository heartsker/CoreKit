//
//  Created by Daniel Pustotin on 04.01.2023.
//

public typealias LoggableInfo = [String: CustomStringConvertible?]

/// Type that supports logging
public protocol Loggable {
    /// Object description for logging
    var logDescription: String { get }

    /// Additional object info for logging
    var info: LoggableInfo { get }
}

// MARK: - Default implementation

public extension Loggable {
    var logDescription: String {
        String(describing: Self.self)
    }

    var info: LoggableInfo {
        [:]
    }
}

extension String: Loggable {
    public var logDescription: String {
        self
    }
}

public extension CustomStringConvertible where Self: Loggable {
    var description: String {
        logDescription
    }
}
