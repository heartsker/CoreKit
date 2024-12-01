//
//  Created by Daniel Pustotin on 22.10.2023.
//

/// Provides experiments for `Poster`
public protocol BackendRequesterExperimentsProvider {
    /// Should retry network requests on failure
    var retryNetworkRequests: Bool { get }
    /// Should slow down network requests
    var slowNetworkRequests: Bool { get }
    var useTestSessionToken: Bool { get }

    /// Number of maximum request retries
    var maxNetworkRequestsRetriesCount: Int { get }
}
