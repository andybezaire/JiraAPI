//
//  AuthURLTests.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import XCTest
@testable import JiraAPI

final class AuthURLTests: XCTestCase {
    func testAuthorizeURL() throws {
            let expected = "https://auth.atlassian.com" +
                "/authorize?" +
                "audience=api.atlassian.com&" +
                "client_id=YOUR_CLIENT_ID&" +
                "scope=REQUESTED_SCOPE_ONE%20REQUESTED_SCOPE_TWO&" +
                "redirect_uri=https://YOUR_APP_CALLBACK_URL&" +
                "state=YOUR_USER_BOUND_VALUE&" +
                "response_type=code&" +
                "prompt=consent"

        let authorizeURL: URL =
                try JiraAPI.Auth.URL.authorize(clientID: "YOUR_CLIENT_ID",
                                       scopes: ["REQUESTED_SCOPE_ONE", "REQUESTED_SCOPE_TWO"],
                                       redirectURI: "https://YOUR_APP_CALLBACK_URL",
                                       userBoundValue: "YOUR_USER_BOUND_VALUE")

            XCTAssertEqual(authorizeURL.absoluteString, expected, "should be correct authorize url")
        }

        func testOauthToken() throws {
            let expected = "https://auth.atlassian.com" +
                "/oauth/token"

            let oauthTokenURL = try JiraAPI.Auth.URL.oauthToken()

            XCTAssertEqual(oauthTokenURL.absoluteString, expected, "should be correct oauth token url")
        }

    static var allTests = [
        ("testAuthorizeURL", testAuthorizeURL),
        ("testOauthToken", testOauthToken),
    ]
}
