//
//  Created by Daniel Pustotin on 04.01.2023.
//

import Foundation

extension URLRequest: Loggable {
    public var logDescription: String {
        "Request with URL: " + (url?.absoluteURL.description ?? "`No URL`")
    }

    public var info: LoggableInfo {
        [
            "method": httpMethod,
            "body": httpBody,
            "query": url?.query
        ]
    }
}
