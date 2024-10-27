//
//  Created by Daniel Pustotin on 21.10.2023.
//

import UIKit

final public class ClipboardManager {
    // MARK: - Public properties

    public var string: String? {
        pasteboard.string
    }

    // MARK: - Constructor

    public init() {}

    // MARK: - Public methods

    public func copy(_ string: String) {
        pasteboard.string = string
    }

    // MARK: - Private properties

    private let pasteboard = UIPasteboard.general
}
