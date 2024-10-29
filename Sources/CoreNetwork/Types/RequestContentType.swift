//
//  Created by Daniel Pustotin on 02.07.2024
//

public enum RequestContentType: String {
    case json = "application/json"
    case jpeg = "image/jpeg"
    case png = "image/png"
}

extension RequestContentType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .json: "json"
        case .jpeg: "jpeg"
        case .png: "png"
        }
    }
}
