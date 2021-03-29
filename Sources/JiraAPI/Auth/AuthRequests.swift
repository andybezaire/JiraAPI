//
//  AuthRequests.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

/// JiraAPI Authorization Related `URLRequest`s
public extension JiraAPI.Auth.Request {
    static func oauthToken(
        clientID: JiraAPI.Auth.ClientID,
        clientSecret: JiraAPI.Auth.ClientSecret,
        code: JiraAPI.Auth.Code,
        redirectURI: JiraAPI.Auth.RedirectURI
    ) throws -> URLRequest {
         URLRequest(url: try JiraAPI.Auth.URL.oauthToken())
            .method(.POST)
            .header(.contentTypeApplicationJSON)
            .body(
                JiraAPI.Auth.Models.OauthTokenRequestBody(
                    clientID: clientID,
                    clientSecret: clientSecret,
                    code: code,
                    redirectURI: redirectURI
                )
            )
    }
}
