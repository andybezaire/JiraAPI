//
//  PageBean.swift
//  
//
//  Created by Andy on 17.4.2021.
//

import Foundation

public extension JiraAPI.Models {
    struct PageBean<T: Decodable>: Decodable {
        public let startAt: Int
        public let total: Int
        public let isLast: Bool
        public let values: [T]
    }
}
