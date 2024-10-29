//
//  Created by Daniel Pustotin on 10.07.2024
//

protocol BaseEndpoint: Endpoint {
    init?(component: EndpointComponent)
}

extension BaseEndpoint where Self: RawRepresentable, RawValue: EndpointComponent {
    init?(component: EndpointComponent) {
        guard let component = component as? RawValue else {
            return nil
        }
        self.init(rawValue: component)
    }
}
