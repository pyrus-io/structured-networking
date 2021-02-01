import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(structured_networkingTests.allTests),
    ]
}
#endif
