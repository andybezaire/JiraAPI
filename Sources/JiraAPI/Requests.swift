//
//  Requests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI.Request {
    // MARK: - URLRequests

    /// Get the array of cloud resources for a user
    /// - Parameter token: authorization token from the auth request
    /// - Returns: `URLRequest` for an array of `CloudResource`s
    static func cloudResources() throws -> URLRequest {
        URLRequest(url: try JiraAPI.URL.cloudResources())
    }

    static func myself(cloudID: JiraAPI.Auth.CloudID) throws -> URLRequest {
        return URLRequest(url: try JiraAPI.URL.myself(cloudID: cloudID))
    }
}
