//
//  Created by Daniel Pustotin on 07.08.2024.
//

final class CodableMock: Codable {
    // MARK: - Public properties

    var title: String
    var number: Int

    // MARK: - Constructor

    init(title: String = String(), number: Int = Int()) {
        self.title = title
        self.number = number
    }
}
