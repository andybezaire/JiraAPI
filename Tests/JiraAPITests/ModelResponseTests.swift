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
    
    func testUserResponse() throws {
        let data = """
        {
          "self": "https://your-domain.atlassian.net/rest/api/3/user?accountId=5b10a2844c20165700ede21g",
          "key": "",
          "accountId": "5b10a2844c20165700ede21g",
          "name": "",
          "emailAddress": "mia@example.com",
          "avatarUrls": {
            "48x48": "https://avatar-management--avatars.server-location.prod.public.atl-paas.net/initials/MK-5.png?size=48&s=48",
            "24x24": "https://avatar-management--avatars.server-location.prod.public.atl-paas.net/initials/MK-5.png?size=24&s=24",
            "16x16": "https://avatar-management--avatars.server-location.prod.public.atl-paas.net/initials/MK-5.png?size=16&s=16",
            "32x32": "https://avatar-management--avatars.server-location.prod.public.atl-paas.net/initials/MK-5.png?size=32&s=32"
          },
          "displayName": "Mia Krystof",
          "active": true,
          "timeZone": "Australia/Sydney",
          "groups": {
            "size": 3,
            "items": []
          },
          "applicationRoles": {
            "size": 1,
            "items": []
          }
        }
        """
        .data(using: .utf8)!

        let object = try JSONDecoder().decode(JiraAPI.Models.UserResponse.self, from: data)

        XCTAssertEqual(object.id, "5b10a2844c20165700ede21g", "should decode response properly")
        XCTAssertEqual(object.email, "mia@example.com", "should decode response properly")
        XCTAssertEqual(object.avatars.count, 4)
        XCTAssertEqual(object.name,"Mia Krystof")
        XCTAssertEqual(object.account, URL(string: "https://your-domain.atlassian.net/rest/api/3/user?accountId=5b10a2844c20165700ede21g")!)
    }
    
    func testMeResponse() throws {
        let data = """
        {
          "account_type": "atlassian",
          "account_id": "112233aa-bb11-cc22-33dd-445566abcabc",
          "email": "mia@example.com",
          "name": "Mia Krystof",
          "picture": "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/112233aa-bb11-cc22-33dd-445566abcabc/1234abcd-9876-54aa-33aa-1234dfsade9487ds",
          "account_status": "active",
          "nickname": "mkrystof",
          "zoneinfo": "Australia/Sydney",
          "locale": "en-US",
          "extended_profile": {
            "job_title": "Designer",
            "organization": "mia@example.com",
            "department": "Design team",
            "location": "Sydney"
          }
        }
        """
        .data(using: .utf8)!

        let object = try JSONDecoder().decode(JiraAPI.Models.MeResponse.self, from: data)

        XCTAssertEqual(object.email, "mia@example.com", "should decode response properly")
        XCTAssertEqual(object.name, "Mia Krystof", "should decode response properly")
        XCTAssertEqual(object.picture, URL(string: "https://avatar-management--avatars.us-west-2.prod.public.atl-paas.net/112233aa-bb11-cc22-33dd-445566abcabc/1234abcd-9876-54aa-33aa-1234dfsade9487ds")!, "should decode response properly")
        XCTAssertEqual(object.id, "112233aa-bb11-cc22-33dd-445566abcabc")
    }

    static var allTests = [
        ("testOauthTokenResponse", testOauthTokenResponse),
        ("testOauthTokenResponseMinimal", testOauthTokenResponseMinimal),
        ("testOauthTokenResponseNilRefresh", testOauthTokenResponseNilRefresh),
        ("testCloudResourceResponse", testCloudResourceResponse),
        ("testUserResponse", testUserResponse),
        ("testMeResponse", testMeResponse),
    ]
}
