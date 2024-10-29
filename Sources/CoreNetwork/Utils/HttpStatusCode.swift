//
//  Created by Daniel Pustotin on 04.05.2024.
//

import Base

public enum HttpStatusCode: Int {
    case ok = 200
    case accepted = 202

    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case conflict = 409

    case internalServerError = 500

    case unknown = -1

    // MARK: - Public properties

    public var isSuccessful: Bool {
        (200..<300).contains(rawValue)
    }

    public var is500: Bool {
        (500..<600).contains(rawValue)
    }
}

extension HttpStatusCode: Loggable {
    public var logDescription: String {
        switch self {
        case .ok: "OK"
        case .accepted: "Accepted"
        case .badRequest: "Bad Request"
        case .forbidden: "Forbidden"
        case .notFound: "Not Found"
        case .conflict: "Conflict"
        case .internalServerError: "Internal Server Error"
        case .unknown: "Unknown"
        }
    }
}
