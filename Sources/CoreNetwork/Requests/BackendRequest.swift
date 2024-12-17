//
//  Created by Daniel Pustotin on 23.04.2024.
//

public struct BackendRequest {
    // MARK: - Public properties

    let endpoint: any Endpoint
    let timeout: TimeInterval
    let method: HttpMethod
    let queryItems: [URLQueryItem]
    let headers: [String: String]
    let contentType: RequestContentType

    let data: RequestDataRepresentable?
    let attachSession: Bool
    let explicitSession: AuthSession?
    let retriesStrategy: RetryStrategy

    // MARK: - Constructor

    internal init(
        endpoint: any Endpoint,
        timeout: TimeInterval = .tenSeconds,
        method: HttpMethod = .get,
        queryItems: [URLQueryItem] = [],
        headers: [String: String] = [:],
        contentType: RequestContentType = .json,
        data: RequestDataRepresentable? = nil,
        attachSession: Bool = false,
        explicitSession: AuthSession? = nil,
        retriesStrategy: RetryStrategy = ExponentialBackoffStrategy()
    ) {
        self.endpoint = endpoint
        self.timeout = timeout
        self.method = method
        self.queryItems = queryItems
        self.headers = headers
        self.contentType = contentType
        self.data = data
        self.attachSession = attachSession
        self.explicitSession = explicitSession
        self.retriesStrategy = retriesStrategy
    }

    // MARK: - Public methods

    func copy(
        timeout: TimeInterval? = nil,
        method: HttpMethod? = nil,
        queryItems: [URLQueryItem]? = nil,
        headers: [String: String]? = nil,
        contentType: RequestContentType? = nil,
        data: RequestDataRepresentable? = nil,
        attachSession: Bool? = nil,
        explicitSession: AuthSession? = nil,
        retriesStrategy: RetryStrategy? = nil
    ) -> BackendRequest {
        BackendRequest(
            endpoint: endpoint,
            timeout: timeout ?? self.timeout,
            method: method ?? self.method,
            queryItems: queryItems ?? self.queryItems,
            headers: headers ?? self.headers,
            contentType: contentType ?? self.contentType,
            data: data ?? self.data,
            attachSession: attachSession ?? self.attachSession,
            explicitSession: explicitSession ?? self.explicitSession,
            retriesStrategy: retriesStrategy ?? self.retriesStrategy
        )
    }

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
