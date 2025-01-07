//
//  Created by Daniel Pustotin on 10.07.2024
//

public protocol VersionedEndpoint: Endpoint {
    static var version: Int { get }
}
