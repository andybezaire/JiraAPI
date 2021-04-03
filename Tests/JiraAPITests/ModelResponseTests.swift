//
//  ModelResponseTests.swift
//  
//
//  Created by Andy on 3.4.2021.
//

@testable import JiraAPI
import XCTest

final class ModelResponseTests: XCTestCase {
    func testOauthTokenResponse() throws {
        let data = #"{"access_token":"ACCESS_TOKEN","expires_in":99,"refresh_token":"REFRESH_TOKEN","scope":"SCOPE","token_type":"TOKEN_TYPE"}"#
            .data(using: .utf8)!

        let object = try JSONDecoder().decode(JiraAPI.Models.OauthTokenResponse.self, from: data)

        XCTAssertEqual(object.token, "ACCESS_TOKEN", "should decode token properly")
        XCTAssertEqual(object.refresh, "REFRESH_TOKEN", "should decode refresh properly")
    }

    func testOauthTokenResponseMinimal() throws {
        let data = #"{"access_token":"ACCESS_TOKEN","refresh_token":"REFRESH_TOKEN"}"#
            .data(using: .utf8)!

        let object = try JSONDecoder().decode(JiraAPI.Models.OauthTokenResponse.self, from: data)

        XCTAssertEqual(object.token, "ACCESS_TOKEN", "should decode token properly")
        XCTAssertEqual(object.refresh, "REFRESH_TOKEN", "should decode refresh properly")
    }

    func testOauthTokenResponseNilRefresh() throws {
        let data = #"{"access_token":"ACCESS_TOKEN","expires_in":99,"scope":"SCOPE","token_type":"TOKEN_TYPE"}"#
            .data(using: .utf8)!

        let object = try JSONDecoder().decode(JiraAPI.Models.OauthTokenResponse.self, from: data)

        XCTAssertEqual(object.token, "ACCESS_TOKEN", "should decode token properly")
        XCTAssertNil(object.refresh, "refresh token should be nil")
    }

    static var allTests = [
        ("testOauthTokenResponse", testOauthTokenResponse),
        ("testOauthTokenResponseMinimal", testOauthTokenResponseMinimal),
        ("testOauthTokenResponseNilRefresh", testOauthTokenResponseNilRefresh),
    ]
}
