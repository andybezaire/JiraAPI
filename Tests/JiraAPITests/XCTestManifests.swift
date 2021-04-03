import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AuthModelTests.allTests),
        testCase(AuthRequestTests.allTests),
        testCase(AuthURLTests.allTests),
        testCase(ModelResponseTests.allTests),
        testCase(ModelTests.allTests),
        testCase(RequestTests.allTests),
        testCase(URLTests.allTests),
    ]
}
#endif
