//
//  URLComponents.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension URLComponents {
    /// Create a `URL` from the components
    /// - Throws: `JiraAPI.URL.Error.malformedURL(components)` with `self`
    /// - Returns: the non-optional `URL`
    func createURL() throws -> URL {
        guard let url = url else { throw JiraAPI.Error.malformedURL(self) }
        return url
    }
}
