//
//  RequestTests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import XCTest
@testable import JiraAPI

final class RequestTests: XCTestCase {
    func testCloudResources() throws {
            let token = "TOKEN"

            let request: URLRequest = try JiraAPI.Request.cloudResources(token: token)

            let expectedURL = "https://api.atlassian.com" +
                "/oauth/token/accessible-resources"

            XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct cloud resources url")

            XCTAssertEqual(request.httpMethod, "GET", "should be get request")

            let authorization = request.allHTTPHeaderFields?["Authorization"]
            XCTAssertEqual(authorization, "Bearer TOKEN", "should be signed with bearer token")
        }

        func testMyself() throws {
            let token = "TOKEN"

            let request: URLRequest = try JiraAPI.Request.myself(token: token, cloudID: "11223344-a1b2-3b33-c444-def123456789")

            let expectedURL = "https://api.atlassian.com" +
                "/ex/jira" +
                "/11223344-a1b2-3b33-c444-def123456789" +
                "/rest/api/3/myself"

            XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct myself url")

            XCTAssertEqual(request.httpMethod, "GET", "should be get request")

            let authorization = request.allHTTPHeaderFields?["Authorization"]
            XCTAssertEqual(authorization, "Bearer TOKEN", "should be signed with bearer token")
        }


    static var allTests = [
        ("testCloudResources", testCloudResources),
        ("testMyself", testMyself),
    ]
}
