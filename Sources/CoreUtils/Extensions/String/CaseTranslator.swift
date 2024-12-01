//
//  Created by Daniel Pustotin on 07.08.2024.
//

import Foundation

public extension String {
    /// Converts a camel cased string to snake case
    /// - Note: `camelCaseToSnakeCase` -> `camel_case_to_snake_case`
    var camelCaseToSnakeCase: String {
        reduce("") { result, character in
            guard character.isUppercase else {
                return result + String(character)
            }
            return result + (result.isEmpty ? "" : .snakeCaseSeparator) + String(character).lowercased()
        }
    }

    /// Converts a camel cased string to snake case and uppercases it
    /// - Note: `camelCaseToUpperCaseSnakeCase` -> `CAMEL_CASE_TO_UPPER_CASE_SNAKE_CASE`
    var camelCaseToUpperCaseSnakeCase: String {
        camelCaseToSnakeCase.uppercased()
    }

    /// Converts a snake cased string to camel case
    /// - Note: `snake_case_to_camel_case` -> `snakeCaseToCamelCase`
    var snakeCaseToCamelCase: String {
        components(separatedBy: CharacterSet(charactersIn: .snakeCaseSeparator))
            .enumerated()
            .reduce("") { result, tuple in
                let (index, component) = tuple
                return result + (index == 0 ? component : component.capitalized)
            }
    }

    /// Converts a snake cased string to camel case and uppercases it
    /// - Note: `snake_case_to_upper_case_camel_case` -> `SnakeCaseToUpperCaseCamelCase`
    var snakeCaseToUpperCaseCamelCase: String {
        snakeCaseToCamelCase.capitalized
    }
}

private extension String {
    static let snakeCaseSeparator = "_"
}
