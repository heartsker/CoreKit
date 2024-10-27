//
//  Created by Daniel Pustotin on 07.08.2024.
//

import XCTest
@testable import CoreTypes

final class ConfigurableTests: XCTestCase {
    // MARK: - Private properties

	private var configurable: ConfigurableMock!

	// MARK: - Life cycle

	override func setUp() {
		super.setUp()

		configurable = ConfigurableMock()
	}

	override func tearDown() {
		configurable = nil
        
		super.tearDown()
	}

	// MARK: - Tests

	func testApply() {
		// Arrange
        let expectedValue = "updated value"

		// Act
		configurable.apply {
			$0.value = expectedValue
		}

		// Assert
		XCTAssertEqual(configurable.value, expectedValue)
	}

	func testWith() {
		// Arrange
		let expectedValue = "updated value"

		// Act
		let result = configurable.with {
			$0.value = expectedValue
		}

		// Assert
		XCTAssertEqual(result.value, expectedValue)
	}
}
