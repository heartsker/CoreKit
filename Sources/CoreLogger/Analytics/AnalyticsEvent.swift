//
//  Created by Daniel Pustotin on 19.07.2024
//

public protocol AnalyticsEvent: Loggable {
    var name: String { get }
    var parameters: JSON { get }
}

public extension AnalyticsEvent {
    var logDescription: String {
        name
    }

    var info: [String: (any CustomStringConvertible)?] {
        parameters
            .mapValues { parameter in
                if let parameter = parameter as? Loggable {
                    return parameter.logDescription
                } else if let parameter = parameter as? CustomStringConvertible {
                    return parameter.description
                } else {
                    return String(describing: parameter)
                }
            }
    }
}
