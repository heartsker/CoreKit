//
//  Created by Daniel Pustotin on 07.08.2024.
//

import XCTest
@testable import CoreTypes

final class JSONTests: XCTestCase {
    // MARK: - Private properties

    private var encodableObject: CodableMock!

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        encodableObject = CodableMock()
    }

    override func tearDown() {
        encodableObject = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testInit() {
        // Arrange
        let expectedJSON: JSON = [
            "title": encodableObject.title,
            "number": encodableObject.number
        ]

        // Act
        let json = JSON(encodableObject)

        // Assert
        XCTAssertEqual(json?.count, expectedJSON.count)
        XCTAssertNotNil(json?["title"] as? String)
        XCTAssertNotNil(json?["number"] as? Int)
        XCTAssertEqual(json?["title"] as? String, expectedJSON["title"] as? String)
        XCTAssertEqual(json?["number"] as? Int, expectedJSON["number"] as? Int)
    }
}
