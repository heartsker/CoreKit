//
//  Created by Daniel Pustotin on 08.07.2022.
//

public extension Dictionary {
    /// Extracts values from the dictionary for the given keys
    /// - Parameter keys: Keys to extract values for
    /// - Returns: Array of values
    func extractValues(for keys: [Key]) -> [Value] {
        var result: [Value] = []

        for key in keys {
            guard let value = self[key] else {
                continue
            }
            result.append(value)
        }
        return result
    }
}
