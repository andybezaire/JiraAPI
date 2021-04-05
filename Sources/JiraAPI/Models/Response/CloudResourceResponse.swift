//
//  CloudResourceResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI.Models {
    struct CloudResourceResponse: Decodable {
        let id: JiraAPI.Auth.CloudID
        public let name: String
        public let url: URL
        public let scopes: [JiraAPI.Auth.Scope]
        let avatarUrl: URL
        
        public var cloudID: JiraAPI.Auth.CloudID { id }
        public var avatar: URL { avatarUrl }
    }
}
