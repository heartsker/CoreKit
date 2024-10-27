//
//  Created by Daniel Pustotin on 30.05.2023.
//

import Foundation

public extension JSONDecoder {
    /// Snake case decoder
    /// Decodes `"some_info_here"` into `"SomeInfoHere"`
    static let snakeCaseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}
