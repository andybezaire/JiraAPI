//
//  CloudResourceResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI {
    struct CloudResourceResponse: Decodable {
        let id: Auth.CloudID
        let name: String
        let scopes: [Auth.Scope]
        let avatarUrl: Foundation.URL
    }
}
