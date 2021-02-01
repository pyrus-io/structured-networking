import XCTest
@testable import structured_networking

final class structured_networkingTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(structured_networking().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
