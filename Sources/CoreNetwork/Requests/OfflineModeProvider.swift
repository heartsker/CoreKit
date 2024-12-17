//
//  Created by Daniel Pustotin on 01.11.2024
//

public protocol OfflineModeProvider: Sendable {
    var isOfflineMode: Bool { get }
}
