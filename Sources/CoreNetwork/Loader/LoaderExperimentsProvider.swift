//
//  Created by Daniel Pustotin on 13.07.2023.
//

/// Provides experiments for `Loader`
public protocol LoaderExperimentsProvider {
    /// Should retry network requests on failure
    var retryNetworkRequests: Bool { get }
    /// Should slow down network requests
    var slowNetworkRequests: Bool { get }

    /// Number of maximum request retries
    var maxNetworkRequestsRetriesCount: Int { get }
}
