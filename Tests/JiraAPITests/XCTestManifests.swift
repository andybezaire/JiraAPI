import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(URLTests.allTests),
        testCase(RequestTests.allTests),
    ]
}
#endif
