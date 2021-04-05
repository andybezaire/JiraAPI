//
//  UserResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI.Models {
    struct UserResponse: Decodable {
        let `self`: URL
        let accountId: String
        let emailAddress: String?
        let avatarUrls: [String: URL]
        let displayName: String
        let active: Bool
        let expand: String?
        
        public var id: String { accountId }
        public var email: String? { emailAddress }
        public var avatars: [String: URL] { avatarUrls }
        public var name: String { displayName }
        public var account: URL { self.`self` }
    }
}
