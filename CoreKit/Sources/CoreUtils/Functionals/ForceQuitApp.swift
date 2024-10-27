//
//  Created by Daniel Pustotin on 24.09.2023.
//

/// Force quits the app (debug configuration only)
public func forceQuitApp() {
    guard Configuration.shared.buildConfiguration.isDebug else {
        return
    }

    assertionFailure("Force quitting the application (triggered manually in code - search for `forceQuitApp` call)")
}
