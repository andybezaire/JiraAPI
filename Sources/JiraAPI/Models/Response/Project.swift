//
//  Project.swift
//  
//
//  Created by Andy on 17.4.2021.
//

import Foundation

public extension JiraAPI.Models {
    struct Project: Decodable, Identifiable {
        public let key: String
        public let name: String
        public let picture: URL?
        //    let issueCount: Int
        
        public var id: String { key }
    }
}
