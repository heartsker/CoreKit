//
//  Created by Daniel Pustotin on 08.05.2024
//

import Foundation

public extension URLComponents {
    var pathComponents: [String] {
        path.split(separator: "/").map(String.init)
    }

    var pathComponent: String {
        pathComponents.joined(separator: "/")
    }

    var pathWithHost: String {
        ([host ?? String()] + pathComponents)
            .joined(separator: "/")
    }

    var queryDictionary: [String: String] {
        queryItems?
            .reduce(into: [:]) { partialResult, item in
                if let value = item.value {
                    partialResult[item.name] = value
                }
            }
            ?? [:]
    }

    func queryItem(_ name: String) -> String? {
        queryItems?
            .first { $0.name == name }?
            .value
    }
}
