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

    func testCloudResourceResponse() throws {
        let data = """
        [
          {
            "id": "1324a887-45db-1bf4-1e99-ef0ff456d421",
            "name": "Site name",
            "url": "https://your-domain.atlassian.net",
            "scopes": [
              "write:jira-work",
              "read:jira-user",
              "manage:jira-configuration"
            ],
            "avatarUrl": "https://site-admin-avatar-cdn.prod.public.atl-paas.net/avatars/240/flag.png"
          }
        ]
        """
        .data(using: .utf8)!

        let object = try JSONDecoder().decode([JiraAPI.Models.CloudResourceResponse].self, from: data).first!

        XCTAssertEqual(object.cloudID, "1324a887-45db-1bf4-1e99-ef0ff456d421", "should decode response properly")
        XCTAssertEqual(object.name, "Site name", "should decode response properly")
        XCTAssertEqual(object.url, URL(string: "https://your-domain.atlassian.net")!, "should decode response properly")
        XCTAssertEqual(object.scopes, ["write:jira-work", "read:jira-user", "manage:jira-configuration"])
        XCTAssertEqual(object.avatar, URL(string: "https://site-admin-avatar-cdn.prod.public.atl-paas.net/avatars/240/flag.png")!)
    }

    static var allTests = [
        ("testOauthTokenResponse", testOauthTokenResponse),
        ("testOauthTokenResponseMinimal", testOauthTokenResponseMinimal),
        ("testOauthTokenResponseNilRefresh", testOauthTokenResponseNilRefresh),
    ]
}
