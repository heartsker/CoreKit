//
//  Created by Daniel Pustotin on 19.07.2024
//

extension Error {
    var description: String {
        switch self {
        case let error as LocalizedError:
            error.localizedDescription

        case let error as CommonError:
            error.errorDescription

        default:
            localizedDescription
        }
    }
}
