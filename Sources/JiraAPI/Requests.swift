//
//  Requests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI.Request {
    // MARK: - URLRequests

    /// Get the array of cloud resources for a user
    /// - Parameter token: authorization token from the auth request
    /// - Returns: `URLRequest` for an array of `CloudResource`s
    static func cloudResources(token: JiraAPI.Auth.Token) throws -> URLRequest {
        URLRequest(url: try JiraAPI.URL.cloudResources())
            .header(.authorizationBearer(token: token))
            .header(.acceptApplicationJSON)
    }

    static func myself(token: JiraAPI.Auth.Token, cloudID: JiraAPI.Auth.CloudID) throws -> URLRequest {
        return URLRequest(url: try JiraAPI.URL.myself(cloudID: cloudID))
            .header(.authorizationBearer(token: token))
            .header(.acceptApplicationJSON)
    }
}

// MARK: - URLRequest utils

extension URLRequest {
    enum HTTPMethod: String {
        case GET
        case POST
    }

    enum HTTPHeader {
        case contentTypeApplicationJSON
        case authorizationBearer(token: JiraAPI.Auth.Token)
        case acceptApplicationJSON
    }

    func method(_ method: HTTPMethod) -> URLRequest {
        var request = self
        request.httpMethod = method.rawValue
        return request
    }

    func header(_ header: HTTPHeader) -> URLRequest {
        var request = self
        switch header {
        case .contentTypeApplicationJSON:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .authorizationBearer(token: let token):
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        case .acceptApplicationJSON:
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        return request
    }

    func body<T>(_ body: T) -> URLRequest where T: Encodable {
        var request = self
        request.httpBody = try? JSONEncoder().encode(body)
        return request
    }
}
