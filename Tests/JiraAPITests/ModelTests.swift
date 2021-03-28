//
//  ModelTests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

@testable import JiraAPI
import XCTest

final class ModelTests: XCTestCase {
    func testUserResponse() throws {
        let expectedUser = JiraAPI.UserResponse(
            self: URL(string: "https://your-domain.atlassian.net/rest/api/3/user?accountId=5b10a2844c20165700ede21g")!,
            accountId: "5b10a2844c20165700ede21g",
            emailAddress: "mia@example.com",
            avatarUrls: [
                "48x48" : URL(string: "https://avatar-management--avatars.server-location.prod.public.atl-paas.net/initials/MK-5.png?size=48&s=48")!],
            displayName: "Mia Krystof",
            active: true,
            expand: nil
        )

        let response = """
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
        """.data(using: .utf8)!

        let decodedUser = try JSONDecoder().decode(JiraAPI.UserResponse.self, from: response)

        XCTAssertEqual(decodedUser.displayName, expectedUser.displayName, "should be encoded to JSON properly")
    }

    static var allTests = [
        ("testUserResponse", testUserResponse),
    ]
}
