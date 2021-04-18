//
//  URLs.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI.URL {
    // MARK: - URLs

    /// `"/oauth/token/accessible-resources"`
    static func cloudResources() throws -> URL {
        try URLComponents(rootPath: "/oauth/token/accessible-resources").createURL()
    }

    /// `"/myself"`
    static func myself(cloudID: String) throws -> URL {
        try URLComponents(cloudID: cloudID, path: "/myself").createURL()
    }
    
    /// `"/me"`
    static func me() throws -> URL {
        return try URLComponents(rootPath: "/me").createURL()
    }
    
    /// `"/project/search?startAt=x"`
    static func allProjects(cloudID: String, startAt index: Int = 0) throws -> URL {
        let startAt = URLQueryItem(name: "startAt", value: "\(index)")
        return try URLComponents(cloudID: cloudID, path: "/project/search", queryItems: [startAt]).createURL()
    }

}

// MARK: - URLComponents utils

private extension URLComponents {
    init(rootPath path: String, queryItems: [URLQueryItem]? = nil) {
        self.init()
        self.scheme = JiraAPI.scheme
        self.host = JiraAPI.host
        self.path = path
        self.queryItems = queryItems
    }

    init(cloudID: String, path: String, queryItems: [URLQueryItem]? = nil) {
        let rootPath = "\(JiraAPI.rootPath)/\(cloudID)\(JiraAPI.apiRoot)\(path)"
        self.init(rootPath: rootPath, queryItems: queryItems)
    }
}
