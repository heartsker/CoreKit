//
//  Created by Daniel Pustotin on 22.10.2023.
//

import Foundation

extension URLResponse {
    var httpStatusCode: HttpStatusCode {
        guard let code = (self as? HTTPURLResponse)?.statusCode else {
            return .unknown
        }
        return HttpStatusCode(rawValue: code) ?? .unknown
    }

    var isSuccessfulStatusCode: Bool {
        httpStatusCode.isSuccessful
    }
}
