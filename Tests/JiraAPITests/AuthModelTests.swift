//
//  AuthModelTests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

@testable import JiraAPI
import XCTest

final class AuthModelTests: XCTestCase {
    func testOauthTokenRequestBody() throws {
        let clientID = "CLIENT_ID"
        let code = "CODE"
        let redirectURI = "REDIRECT_URI"
        let clientSecret = "CLIENT_SECRET"

        let expectedJSON = #"{"client_id":"CLIENT_ID","code":"CODE","redirect_uri":"REDIRECT_URI","client_secret":"CLIENT_SECRET","grant_type":"authorization_code"}"#

        let object = JiraAPI.Models
            .OauthTokenRequestBody(clientID: clientID, clientSecret: clientSecret, code: code, redirectURI: redirectURI)

        let body = try JSONEncoder().encode(object)

        XCTAssertEqual(String(data: body, encoding: .utf8), expectedJSON, "should be encoded to JSON properly")
    }

    func testOauthTokenRefreshRequestBody() throws {
        let clientID = "CLIENT_ID"
        let refreshToken = "REFRESH_TOKEN"
        let clientSecret = "CLIENT_SECRET"

        let expectedJSON = #"{"client_id":"CLIENT_ID","refresh_token":"REFRESH_TOKEN","client_secret":"CLIENT_SECRET","grant_type":"refresh_token"}"#

        let object = JiraAPI.Models
            .OauthTokenRefreshRequestBody(clientID: clientID, clientSecret: clientSecret, refreshToken: refreshToken)

        let body = try JSONEncoder().encode(object)

        XCTAssertEqual(String(data: body, encoding: .utf8), expectedJSON, "should be encoded to JSON properly")
    }

    static var allTests = [
        ("testOauthTokenRequestBody", testOauthTokenRequestBody),
        ("testOauthTokenRefreshRequestBody", testOauthTokenRefreshRequestBody),
    ]
}
