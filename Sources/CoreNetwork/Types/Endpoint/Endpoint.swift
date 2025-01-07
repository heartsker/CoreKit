//
//  Created by Daniel Pustotin on 15.05.2023.
//

<<<<<<< Updated upstream
protocol Endpoint: Loggable, Sendable {
=======
public protocol Endpoint: Loggable {
>>>>>>> Stashed changes
    var component: EndpointComponent { get }

    static var baseEndpoint: BaseEndpoint? { get }
}

public extension Endpoint {
    // MARK: - Public properties

    var url: String {
        urlComponents.map(\.path).joinedComponents
    }

    var logDescription: String {
        url
    }
}

// MARK: - Private methods

private extension Endpoint {
    var urlComponents: [EndpointComponent] {
        baseComponents +
            commonPrefixComponents +
            versionComponents +
            [component]
    }

    var baseComponents: [EndpointComponent] {
        Self.baseEndpoint?.urlComponents ?? []
    }

    var versionComponents: [EndpointComponent] {
        guard let type = Self.self as? VersionedEndpoint.Type else {
            return []
        }

        return ["v\(type.version)"]
    }

    var commonPrefixComponents: [EndpointComponent] {
        guard let type = Self.self as? CommonPrefixEndpoint.Type else {
            return []
        }

        return type.commonPrefix
    }
}

extension Endpoint where Self: RawRepresentable, RawValue: EndpointComponent {
    var component: EndpointComponent {
        rawValue
    }
}
