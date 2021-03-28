import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(URLTests.allTests),
        testCase(RequestTests.allTests),
        testCase(AuthURLTests.allTests),
        testCase(AuthRequestTests.allTests),
        testCase(AuthModelTests.allTests),
    ]
}
#endif
