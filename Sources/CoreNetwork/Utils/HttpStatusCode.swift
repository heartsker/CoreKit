//
//  Created by Daniel Pustotin on 04.05.2024.
//

public enum HttpStatusCode: RawRepresentable, CaseIterable, Sendable {
    case ok
    case created
    case accepted
    case noContent
    case resetContent
    case partialContent
    case multipleChoices
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case temporaryRedirect
    case permanentRedirect
    case badRequest
    case unauthorized
    case paymentRequired
    case forbidden
    case notFound
    case methodNotAllowed
    case notAcceptable
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case unprocessableEntity
    case tooManyRequests
    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case httpVersionNotSupported

    case other(code: Int)
    case unknown

    // MARK: - Properties

    public var rawValue: Int {
        switch self {
        case .ok: 200
        case .created: 201
        case .accepted: 202
        case .noContent: 204
        case .resetContent: 205
        case .partialContent: 206
        case .multipleChoices: 300
        case .movedPermanently: 301
        case .found: 302
        case .seeOther: 303
        case .notModified: 304
        case .useProxy: 305
        case .temporaryRedirect: 307
        case .permanentRedirect: 308
        case .badRequest: 400
        case .unauthorized: 401
        case .paymentRequired: 402
        case .forbidden: 403
        case .notFound: 404
        case .methodNotAllowed: 405
        case .notAcceptable: 406
        case .proxyAuthenticationRequired: 407
        case .requestTimeout: 408
        case .conflict: 409
        case .gone: 410
        case .lengthRequired: 411
        case .preconditionFailed: 412
        case .payloadTooLarge: 413
        case .uriTooLong: 414
        case .unsupportedMediaType: 415
        case .rangeNotSatisfiable: 416
        case .expectationFailed: 417
        case .unprocessableEntity: 422
        case .tooManyRequests: 429
        case .internalServerError: 500
        case .notImplemented: 501
        case .badGateway: 502
        case .serviceUnavailable: 503
        case .gatewayTimeout: 504
        case .httpVersionNotSupported: 505
        case .other(let code): code
        case .unknown: -1
        }
    }

    public static var allCases: [HttpStatusCode] {
        [
            .ok,
            .created,
            .accepted,
            .noContent,
            .resetContent,
            .partialContent,
            .multipleChoices,
            .movedPermanently,
            .found,
            .seeOther,
            .notModified,
            .useProxy,
            .temporaryRedirect,
            .permanentRedirect,
            .badRequest,
            .unauthorized,
            .paymentRequired,
            .forbidden,
            .notFound,
            .methodNotAllowed,
            .notAcceptable,
            .proxyAuthenticationRequired,
            .requestTimeout,
            .conflict,
            .gone,
            .lengthRequired,
            .preconditionFailed,
            .payloadTooLarge,
            .uriTooLong,
            .unsupportedMediaType,
            .rangeNotSatisfiable,
            .expectationFailed,
            .unprocessableEntity,
            .tooManyRequests,
            .internalServerError,
            .notImplemented,
            .badGateway,
            .serviceUnavailable,
            .gatewayTimeout,
            .httpVersionNotSupported
        ]
    }

    public var isSuccessful: Bool {
        (200..<300).contains(rawValue)
    }

    public var isClientError: Bool {
        (400..<500).contains(rawValue)
    }

    public var isServerError: Bool {
        (500..<600).contains(rawValue)
    }

    // MARK: - Constructor

    public init?(rawValue: Int) {
        self = HttpStatusCode.allCases
            .first { $0.rawValue == rawValue } ?? .other(code: rawValue)
    }
}

extension HttpStatusCode: Loggable {
    public var logDescription: String {
        switch self {
        case .ok: "OK"
        case .created: "Created"
        case .accepted: "Accepted"
        case .noContent: "No Content"
        case .resetContent: "Reset Content"
        case .partialContent: "Partial Content"
        case .multipleChoices: "Multiple Choices"
        case .movedPermanently: "Moved Permanently"
        case .found: "Found"
        case .seeOther: "See Other"
        case .notModified: "Not Modified"
        case .useProxy: "Use Proxy"
        case .temporaryRedirect: "Temporary Redirect"
        case .permanentRedirect: "Permanent Redirect"
        case .badRequest: "Bad Request"
        case .unauthorized: "Unauthorized"
        case .paymentRequired: "Payment Required"
        case .forbidden: "Forbidden"
        case .notFound: "Not Found"
        case .methodNotAllowed: "Method Not Allowed"
        case .notAcceptable: "Not Acceptable"
        case .proxyAuthenticationRequired: "Proxy Authentication Required"
        case .requestTimeout: "Request Timeout"
        case .conflict: "Conflict"
        case .gone: "Gone"
        case .lengthRequired: "Length Required"
        case .preconditionFailed: "Precondition Failed"
        case .payloadTooLarge: "Payload Too Large"
        case .uriTooLong: "URI Too Long"
        case .unsupportedMediaType: "Unsupported Media Type"
        case .rangeNotSatisfiable: "Range Not Satisfiable"
        case .expectationFailed: "Expectation Failed"
        case .unprocessableEntity: "Unprocessable Entity"
        case .tooManyRequests: "Too Many Requests"
        case .internalServerError: "Internal Server Error"
        case .notImplemented: "Not Implemented"
        case .badGateway: "Bad Gateway"
        case .serviceUnavailable: "Service Unavailable"
        case .gatewayTimeout: "Gateway Timeout"
        case .httpVersionNotSupported: "HTTP Version Not Supported"
        case .other(let code): "Other \(code)"
        case .unknown: "Unknown"
        }
    }
}
