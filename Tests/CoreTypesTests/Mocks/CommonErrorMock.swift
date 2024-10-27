//
//  Created by Daniel Pustotin on 07.08.2024.
//

import CoreTypes

enum CommonErrorMock: CommonError {
    case theOnlyError
}

enum CommonErrorRawRepresentableMock: String, CommonError {
    case theOnlyError = "the only error"
}
