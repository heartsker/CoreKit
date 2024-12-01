//
//  Created by Daniel Pustotin on 23.04.2024.
//

final public class BackendRequest: Configurable {
    // MARK: - Public properties

    var endpoint: any Endpoint
    var timeout: TimeInterval = .tenSeconds
    var method: HttpMethod = .get
    var queryItems: [URLQueryItem] = []
    var headers: [String: String] = [:]
    var contentType: RequestContentType = .json

    var data: Encodable?
    var attachSession = false
    var explicitSession: AuthSession?
    var retriesStrategy: RetryStrategy = ExponentialBackoffStrategy()

    // MARK: - Constructor

    init(endpoint: any Endpoint) {
        self.endpoint = endpoint
    }

    // MARK: - Public methods

    func buildURLRequest() throws -> (URLRequest, Data?) {
        guard let url = URL(string: endpoint.url) else {
            throw BackendRequesterError.badEndpoint(endpoint)
        }

        var request = URLRequest(
            url: url,
            timeoutInterval: timeout
        )
        request.httpMethod = method.rawValue
        request.url?.append(queryItems: queryItems)
        request.allHTTPHeaderFields = headers

        request.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")

        let contentData: Data?

        switch contentType {
        case .json:
            contentData = JSON(from: data ?? Data())?.encoded

        case .jpeg, .png:
            contentData = data as? Data
        }

        if method == .get, contentData != nil {
            logger.error("Wrong request format", error: BackendRequesterError.dataPassedForGetRequest)
        }

        return (request, contentData)
    }
}

extension BackendRequest: Loggable {
    public var logDescription: String {
        "Backend request to \(endpoint.logDescription)"
    }

    public var info: [String: (any CustomStringConvertible)?] {
        [
            "endpoint": endpoint.logDescription,
            "timeout": timeout,
            "method": method.logDescription,
            "query items": queryItems,
            "headers": headers,
            "content type": contentType,
            "has data": data != nil,
            "attach session": attachSession,
            "retries strategy": retriesStrategy.logDescription
        ]
    }
}

extension BackendRequest: CustomStringConvertible {}
