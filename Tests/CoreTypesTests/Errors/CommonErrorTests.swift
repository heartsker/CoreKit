//
//  Created by Daniel Pustotin on 07.08.2024.
//

import XCTest
@testable import CoreTypes

final class CommonErrorTests: XCTestCase {
    // MARK: - Private properties

    private var commonError: CommonError!
    private var commonErrorRawRepresentable: CommonError!

    // MARK: - Life cycle

    override func setUp() {
        super.setUp()

        commonError = CommonErrorMock.theOnlyError
        commonErrorRawRepresentable = CommonErrorRawRepresentableMock.theOnlyError
    }

    override func tearDown() {
        commonError = nil
        commonErrorRawRepresentable = nil
        
        super.tearDown()
    }

    // MARK: - Tests

    func testErrorDescription() {
        // Arrange
        let expectedErrorDescription = "TheOnlyError"
        let expectedErrorDescriptionRawRepresentable = "The Only Error"

        // Act
        let errorDescription = commonError.errorDescription
        let errorDescriptionRawRepresentable = commonErrorRawRepresentable.errorDescription

        // Assert
        XCTAssertEqual(errorDescription, expectedErrorDescription)
        XCTAssertEqual(errorDescriptionRawRepresentable, expectedErrorDescriptionRawRepresentable)
    }
}
