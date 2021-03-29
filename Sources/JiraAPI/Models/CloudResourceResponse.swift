//
//  CloudResourceResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI.Models {
    struct CloudResourceResponse: Decodable {
        let id: JiraAPI.Auth.CloudID
        let name: String
        let scopes: [JiraAPI.Auth.Scope]
        let avatarUrl: Foundation.URL
    }
}
