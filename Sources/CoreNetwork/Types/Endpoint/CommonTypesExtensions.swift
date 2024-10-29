//
//  Created by Daniel Pustotin on 10.07.2024
//

// MARK: - String + EndpointComponent

extension String: EndpointComponent {
    public var path: String {
        self
    }
}

// MARK: - String + BaseEndpoint

extension String: BaseEndpoint {
    static let baseEndpoint: BaseEndpoint? = nil

    var component: EndpointComponent {
        path
    }

    init?(component: EndpointComponent) {
        self = component.path
    }
}

// MARK: - Int + EndpointComponent

extension Int: EndpointComponent {
    var path: String {
        String(self)
    }
}

// MARK: - Array

extension Array where Element: EndpointComponent {
    var joinedComponents: String {
        map(\.path)
            .filter(\.isNotEmpty)
            .joined(separator: "/")
    }
}
