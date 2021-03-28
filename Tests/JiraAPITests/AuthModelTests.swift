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

        let object = JiraAPI.Auth
            .OauthTokenRequestBody(clientID: clientID, clientSecret: clientSecret, code: code, redirectURI: redirectURI)

        let body = try JSONEncoder().encode(object)

        XCTAssertEqual(String(data: body, encoding: .utf8), expectedJSON, "should be encoded to JSON properly")
    }

    static var allTests = [
        ("testOauthTokenRequestBody", testOauthTokenRequestBody),
    ]
}
