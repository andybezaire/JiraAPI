import XCTest

import JiraAPITests

var tests = [XCTestCaseEntry]()
tests += JiraAPITests.allTests()
XCTMain(tests)
