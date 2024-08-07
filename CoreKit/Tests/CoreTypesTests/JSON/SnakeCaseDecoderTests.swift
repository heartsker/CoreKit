//
//  Created by Daniel Pustotin on 07.08.2024.
//

import XCTest
@testable import CoreTypes

final class SnakeCaseDecoderTests: XCTestCase {
    // MARK: - Private properties

    private var snakeCaseDecoder: JSONDecoder!

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        snakeCaseDecoder = JSONDecoder.snakeCaseDecoder
    }

    override func tearDown() {
        snakeCaseDecoder = nil

        super.tearDown()
    }

    // MARK: - Tests

    func testDecode() {
        // Arrange
        let object = CodableMock(title: "test", number: 1)
        let data = (try? JSONEncoder().encode(object)) ?? Data()

        // Act
        let decodedObject = try? snakeCaseDecoder.decode(CodableMock.self, from: data)

        // Assert
        XCTAssertNotNil(decodedObject)
        XCTAssertEqual(decodedObject?.title, object.title)
        XCTAssertEqual(decodedObject?.number, object.number)
    }
}
