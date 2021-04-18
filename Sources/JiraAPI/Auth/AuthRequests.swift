//
//  AuthRequests.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

/// JiraAPI Authorization Related `URLRequest`s
public extension JiraAPI.Auth.Request {
    typealias Auth = JiraAPI.Auth
    typealias ClientID = JiraAPI.Auth.ClientID
    typealias ClientSecret = JiraAPI.Auth.ClientSecret
    typealias Code = JiraAPI.Auth.Code
    typealias RedirectURI = JiraAPI.Auth.RedirectURI
    typealias RefreshToken = JiraAPI.Auth.RefreshToken

    static func oauthToken(
        clientID: ClientID, clientSecret: ClientSecret, code: Code, redirectURI: RedirectURI
    ) throws -> URLRequest {
        URLRequest(
            url: try JiraAPI.Auth.URL.oauthToken(),
            method: .POST,
            headers: [.contentTypeApplicationJSON],
            body: JiraAPI.Models.OauthTokenRequestBody(
                clientID: clientID,
                clientSecret: clientSecret,
                code: code,
                redirectURI: redirectURI
            )
        )
    }

    static func oauthTokenRefresh(
        clientID: ClientID, clientSecret: ClientSecret, refreshToken: RefreshToken
    ) throws -> URLRequest {
        URLRequest(
            url: try JiraAPI.Auth.URL.oauthToken(),
            method: .POST,
            headers: [.contentTypeApplicationJSON],
            body: JiraAPI.Models.OauthTokenRefreshRequestBody(
                clientID: clientID,
                clientSecret: clientSecret,
                refreshToken: refreshToken
            )
        )
    }
}
