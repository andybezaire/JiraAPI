//
//  URLRequest.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

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

    func settingMethod(_ method: HTTPMethod) -> URLRequest {
        var request = self
        request.httpMethod = method.rawValue
        return request
    }

    func addingHeader(_ header: HTTPHeader) -> URLRequest {
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

    private func addingHeaders(_ headers: [HTTPHeader]) -> URLRequest {
        headers.reduce(self) { $0.addingHeader($1) }
    }

    func addingBody<T>(_ body: T) -> URLRequest where T: Encodable {
        var request = self
        request.httpBody = try? JSONEncoder().encode(body)
        return request
    }

    init<T>(url: URL, method: HTTPMethod, headers: [HTTPHeader], body: T) where T: Encodable {
        self = URLRequest(url: url)
            .settingMethod(method)
            .addingHeaders(headers)
            .addingBody(body)
    }
}
