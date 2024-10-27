//
//  Created by Daniel Pustotin on 02.06.2022.
//

import Foundation

/// Provides access to the app's configuration
final public class Configuration {
    // MARK: - Public properties

    public static var shared: Self {
        Self()
    }

    public let buildConfiguration: BuildConfiguration

    // MARK: - Constructor

    private init() {
        self.buildConfiguration = BuildConfiguration(
            rawValue: PropertyListReader.value(for: .buildConfiguration)
        ) ?? .debug
    }
}
