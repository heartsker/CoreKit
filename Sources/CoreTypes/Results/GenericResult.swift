//
//  Created by Daniel Pustotin on 07.08.2024.
//

public typealias GenericResult<T> = Result<T, Error>
public typealias VoidResult = GenericResult<Void>

public extension GenericResult {
    /// Value erased result
    var voidResult: VoidResult {
        switch self {
        case .success: .success
        case .failure(let error): .failure(error)
        }
    }
}

public extension VoidResult {
    /// ``VoidResult`` with success state
    static var success: VoidResult {
        .success(())
    }
}
