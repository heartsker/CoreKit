//
//  Created by Daniel Pustotin on 23.07.2024
//

import Foundation

public struct CommonLocalizedError: LocalizedError {
    // MARK: - Properties

    public let errorDescription: String?

    // MARK: - Initialization

    public init(_ errorDescription: String?) {
        self.errorDescription = errorDescription
    }
}
