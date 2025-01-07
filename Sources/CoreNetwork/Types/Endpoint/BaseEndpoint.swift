//
//  Created by Daniel Pustotin on 10.07.2024
//

public protocol BaseEndpoint: Endpoint {
    init?(component: EndpointComponent)
}

extension BaseEndpoint where Self: RawRepresentable, RawValue == EndpointComponent {
    init?(component: EndpointComponent) {
        self.init(rawValue: component)
    }
}
