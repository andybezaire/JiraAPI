//
//  URLTests.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import XCTest
@testable import JiraAPI

final class URLTests: XCTestCase {
    func testCloudResourcesURL() throws {
            let expected = "https://api.atlassian.com" +
                "/oauth/token/accessible-resources"

            let cloudResources = try JiraAPI.URL.cloudResources()

            XCTAssertEqual(cloudResources.absoluteString, expected, "should be correct cloud resources url")
        }

        func testMyselfURL() throws {
            let expected = "https://api.atlassian.com" +
                "/ex/jira" +
                "/11223344-a1b2-3b33-c444-def123456789" +
                "/rest/api/3/myself"

            let myselfURL = try JiraAPI.URL.myself(cloudID: "11223344-a1b2-3b33-c444-def123456789")

            XCTAssertEqual(myselfURL.absoluteString, expected, "should be correct myself url")
        }
    
    func testMeURL() throws {
        let expected = "https://api.atlassian.com" +
            "/me"

        let meURL = try JiraAPI.URL.me()

        XCTAssertEqual(meURL.absoluteString, expected, "should be correct me url")
    }

    static var allTests = [
        ("testCloudResourcesURL", testCloudResourcesURL),
        ("testMyselfURL", testMyselfURL),
        ("testMeURL", testMeURL),
    ]
}
