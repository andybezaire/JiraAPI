//
//  MeResponse.swift
//  
//
//  Created by Andy on 12.4.2021.
//

import Foundation
public extension JiraAPI.Models {
    struct MeResponse: Decodable {
        let account_id: String
        public let email: String
        public let name: String
        public let picture: URL
        let account_status: String
        let nickname: String
        let expand: String?
        
        public var id: String { account_id }
    }
}
