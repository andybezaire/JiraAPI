//
//  AuthRequestTests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

@testable import JiraAPI
import XCTest

final class AuthRequestTests: XCTestCase {
    func testOauthToken() throws {
        let clientID = "CLIENT_ID"
        let clientSecret = "CLIENT_SECRET"
        let code = "CODE"
        let redirectURI = "REDIRECT_URI"

        let request = try JiraAPI.Auth.Request
            .oauthToken(clientID: clientID, clientSecret: clientSecret, code: code, redirectURI: redirectURI)

        let expectedURL = "https://auth.atlassian.com" +
            "/oauth/token"

        XCTAssertEqual(request.url?.absoluteString, expectedURL, "should be correct oauth token url")

        XCTAssertEqual(request.httpMethod, "POST", "should be post request")

        let body = JiraAPI.Auth.Models
            .OauthTokenRequestBody(clientID: clientID, clientSecret: clientSecret, code: code, redirectURI: redirectURI)
        let encodedBody = try JSONEncoder().encode(body)
        XCTAssertEqual(request.httpBody, encodedBody, "should be signed with bearer token")
    }

    static var allTests = [
        ("testOauthToken", testOauthToken),
    ]
}
