//
//  Created by Daniel Pustotin on 23.07.2022.
//

import Foundation

public enum LoadingError: CommonError {
    case failedComposeURL(reason: String)
    case failed(type: Any)
    case badRequest(request: URLRequest)
    case badURL(url: URL?)
    case noURL
    case skipped
    case unknown

    // MARK: - Public properties

    public var errorDescription: String {
        switch self {
        case .failedComposeURL(let reason):
            "Failed to compose URL - " + reason

        case .failed(let type):
            "Failed to load `" + String(describing: type) + "` instance"
        case .badURL(let url):
            "Bad URL - `" + (url?.absoluteString ?? "nil") + "`"
        case .badRequest(let request):
            "Bad response for request " + request.description

        case .noURL:
            "Failed to create URL"
        case .skipped:
            "Loading was skipped"
        case .unknown:
            "Unknown error occurred"
        }
    }
}
