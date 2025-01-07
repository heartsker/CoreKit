//
//  Created by Daniel Pustotin on 11.03.2023.
//

import Foundation

/// Error that can occur while building or executing a backend request
enum BackendRequesterError: CommonError {
    case badEndpoint(_ endpoint: any Endpoint)
    case failedToDecodeSchema(_ schema: Any.Type)
    case unknown
    case dataPassedForGetRequest
    case badResponseStatusCode(HttpStatusCode)

    // MARK: - Public properties

    var errorDescription: String {
        switch self {
        case let .badEndpoint(endpoint):
            "Failed to build URL for path `\(endpoint.url)`"
        case let .failedToDecodeSchema(schema):
            "Failed to decode schema `\(schema)`"
        case .unknown:
            "Unknown error occurred"
        case .dataPassedForGetRequest:
            "Data passed for GET request"
        case .badResponseStatusCode(let statusCode):
            "Bad response status code - `\(statusCode.logDescription)`"
        }
    }
}
