//
//  Created by Daniel Pustotin on 16.07.2023.
//

import Foundation

/// Experiments provider for `DefaultLoaderConfiguration`
public protocol DefaultLoaderConfigurationExperimentsProvider {
    /// Should store and use restored network response
    var saveNetworkResponse: Bool { get }
    /// Time to store response
    var networkResponseStoringTime: TimeInterval { get }
}
