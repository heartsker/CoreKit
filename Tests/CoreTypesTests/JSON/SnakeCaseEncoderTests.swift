//
//  Created by Daniel Pustotin on 07.08.2024.
//

import XCTest
@testable import CoreTypes

final class SnakeCaseEncoderTests: XCTestCase {
    // MARK: - Private properties

    private var snakeCaseEncoder: JSONEncoder!

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        snakeCaseEncoder = JSONEncoder.snakeCaseEncoder
    }

    override func tearDown() {
        snakeCaseEncoder = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testEncode() {
        // Arrange
        let object = CodableMock(title: "test", number: 1)
        let data = (try? JSONEncoder().encode(object)) ?? Data()

        // Act
        let encodedObject = try? snakeCaseEncoder.encode(object)

        // Assert
        XCTAssertNotNil(encodedObject)
        XCTAssertEqual(encodedObject, data)
    }
}
