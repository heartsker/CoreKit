//
//  Created by Daniel Pustotin on 20.06.2023.
//

import CoreTypes

precedencegroup SecondaryTernaryPrecedence {
    associativity: right
    higherThan: TernaryPrecedence
    lowerThan: LogicalDisjunctionPrecedence
}

infix operator ?| : SecondaryTernaryPrecedence
infix operator !| : TernaryPrecedence

// swiftlint:disable static_operator

/// Optional `Bool` ternary operator
/// - Parameters:
///   - lhs: The optional boolean to check value of
///   - rhs: Ternary expression
/// - Returns: Result of applying ternary expression
public func ?| <T>(
    lhs: @autoclosure () -> Bool?,
    rhs: @escaping @autoclosure () -> T
) -> (Bool?, () -> T) {
    (lhs(), rhs)
}

/// Optional ternary expression
/// - Parameters:
///   - lhs: Condition and block to execute if condition is `true`
///   - rhs: Block to execute if condition is `false` or `nil`
/// - Returns: Result of ternary expression
@discardableResult
public func !| <T>(
    lhs: (condition: Bool?, ifTrue: () -> T),
    rhs: @escaping @autoclosure () -> T
) -> T {
    if let condition = lhs.condition, condition {
        return lhs.ifTrue()
    } else {
        return rhs()
    }
}
// swiftlint:enable static_operator

public extension Optional where Wrapped == Bool {
    /// Whether the value is `true` or not
    var isTrue: Bool {
        self ?? false
    }

    /// Whether the value is`false` or `nil` or not
    var isNotTrue: Bool {
        !isTrue
    }

    /// Whether the value is`false` or not
    var isFalse: Bool {
        isNotTrue && self != nil
    }

    /// Executes action if optional `Bool?` value is `true`
    /// - Parameter action: Action to execute
    @discardableResult
    func ifTrue(do action: VoidAction) -> Bool {
        if self ?? false {
            action()
        }
        return self ?? false
    }
}
