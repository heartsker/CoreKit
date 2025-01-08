//
//  Created by Daniel Pustotin on 10.07.2024
//

// MARK: - String + EndpointComponent

extension String: EndpointComponent {
    // MARK: - Properties

    public var path: String {
        self
    }
}

// MARK: - String + BaseEndpoint

extension String: BaseEndpoint {
    // MARK: - Properties
    public static let baseEndpoint: BaseEndpoint? = nil

    public var component: EndpointComponent {
        path
    }

    // MARK: - Constructor

    public init?(component: EndpointComponent) {
        self = component.path
    }
}

// MARK: - Int + EndpointComponent

extension Int: EndpointComponent {
    // MARK: - Properties

    public var path: String {
        String(self)
    }
}

// MARK: - Array

extension Array where Element: EndpointComponent {
    // MARK: - Properties

    public var joinedComponents: String {
        map(\.path)
            .filter(\.isNotEmpty)
            .joined(separator: "/")
    }
}
