//
//  Created by Daniel Pustotin on 14.07.2024
//

public protocol CommonError: Error {
    var errorDescription: String { get }
}

public extension CommonError {
    var errorDescription: String {
        String(describing: self).firstCapitalized
    }
}

public extension CommonError where Self: RawRepresentable, Self.RawValue == String {
    var errorDescription: String {
        self.rawValue.firstCapitalized
    }
}
