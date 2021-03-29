//
//  UserResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI.Models {
    struct UserResponse: Decodable {
        let `self`: Foundation.URL
        let accountId: String
        let emailAddress: String?
        let avatarUrls: [String: Foundation.URL]
        let displayName: String
        let active: Bool
        let expand: String?
    }
}
