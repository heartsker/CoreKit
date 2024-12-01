//
//  Created by Daniel Pustotin on 16.07.2023.
//

/// Declares configuration for loading process
public protocol LoaderConfiguration {
    /// Should store and use restored network response
    var saveAndRestoreResponse: Bool { get }
    /// Time to store response
    var responseStoringTime: TimeInterval { get }
}
