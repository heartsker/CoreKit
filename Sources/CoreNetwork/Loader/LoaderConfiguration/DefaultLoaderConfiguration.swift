//
//  Created by Daniel Pustotin on 16.07.2023.
//

import Base

final public class DefaultLoaderConfiguration: LoaderConfiguration {
    // MARK: - Public properties

    public var saveAndRestoreResponse: Bool {
        experimentsProvider.saveNetworkResponse
    }

    public var responseStoringTime: TimeInterval {
        experimentsProvider.networkResponseStoringTime
    }

    // MARK: - Constructor

    public init(experimentsProvider: DefaultLoaderConfigurationExperimentsProvider) {
        self.experimentsProvider = experimentsProvider
    }

    // MARK: - Private properties

    private let experimentsProvider: DefaultLoaderConfigurationExperimentsProvider
}
