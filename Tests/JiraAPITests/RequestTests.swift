//
//  RequestTests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

@testable import JiraAPI
import XCTest

final class RequestTests: XCTestCase {
    func testCloudResources() throws {
        let request: URLRequest = try JiraAPI.Request.cloudResources()

        let expectedURL = "https://api.atlassian.com" +
            "/oauth/token/accessible-resources"

        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct cloud resources url")

        XCTAssertEqual(request.httpMethod, "GET", "should be get request")
    }

    func testMyself() throws {
        let request: URLRequest = try JiraAPI.Request.myself(cloudID: "11223344-a1b2-3b33-c444-def123456789")

        let expectedURL = "https://api.atlassian.com" +
            "/ex/jira" +
            "/11223344-a1b2-3b33-c444-def123456789" +
            "/rest/api/3" +
            "/myself"

        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct myself url")

        XCTAssertEqual(request.httpMethod, "GET", "should be get request")
    }

    func testMe() throws {
        let request: URLRequest = try JiraAPI.Request.me()

        let expectedURL = "https://api.atlassian.com" +
            "/me"

        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct myself url")

        XCTAssertEqual(request.httpMethod, "GET", "should be get request")
    }

    func testAllProducts() throws {
        let request: URLRequest = try JiraAPI.Request.allProjects(cloudID: "11223344-a1b2-3b33-c444-def123456789")

        let expectedURL = "https://api.atlassian.com" +
            "/ex/jira" +
            "/11223344-a1b2-3b33-c444-def123456789" +
            "/rest/api/3" +
            "/project/search" +
            "?startAt=0"


        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct url")

        XCTAssertEqual(request.httpMethod, "GET", "should be get request")
    }

    func testAllProducts1() throws {
        let request: URLRequest = try JiraAPI.Request.allProjects(
            cloudID: "11223344-a1b2-3b33-c444-def123456789",
            startAt: 1
        )

        let expectedURL = "https://api.atlassian.com" +
            "/ex/jira" +
            "/11223344-a1b2-3b33-c444-def123456789" +
            "/rest/api/3" +
            "/project/search" +
            "?startAt=1"


        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct url")

        XCTAssertEqual(request.httpMethod, "GET", "should be get request")
    }

    static var allTests = [
        ("testCloudResources", testCloudResources),
        ("testMyself", testMyself),
        ("testMe", testMe),
        ("testAllProducts", testAllProducts),
    ]
}
