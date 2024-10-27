//
//  Created by Daniel Pustotin on 02.11.2023.
//

public enum BuildConfiguration: String {
    case debug = "Debug"
    case release = "Release"

    // MARK: - Public properties

    public var isDebug: Bool {
        self == .debug
    }
}
