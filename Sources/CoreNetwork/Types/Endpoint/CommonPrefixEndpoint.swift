//
//  Created by Daniel Pustotin on 10.07.2024
//

protocol CommonPrefixEndpoint: Endpoint {
    static var commonPrefix: [EndpointComponent] { get }
}
