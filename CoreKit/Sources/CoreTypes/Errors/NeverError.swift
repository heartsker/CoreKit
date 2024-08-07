//
//  Created by Daniel Pustotin on 10.07.2024
//

public struct NeverError: CommonError {
    // MARK: - Public properties

    public var errorDescription: String {
        preconditionFailure("\(Self.Type.self) should never be thrown")
    }

    // MARK: - Constructor

    public init() {}
}
