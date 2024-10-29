//
//  Created by Daniel Pustotin on 19.07.2024
//

enum LogLevel: Int, CaseIterable {
    case debug
    case warning
    case error
    case critical

    // MARK: - Public properties

    var name: String {
        switch self {
        case .debug: "debug"
        case .warning: "warning"
        case .error: "error"
        case .critical: "critical"
        }
    }

    var emoji: String {
        switch self {
        case .debug: "👀"
        case .warning: "🔆"
        case .error: "⚠️"
        case .critical: "❌"
        }
    }
}
