//
//  OauthTokenRefreshRequestBody.swift
//  
//
//  Created by Andy on 4.4.2021.
//

import Foundation

public extension JiraAPI.Models {
    struct OauthTokenRefreshRequestBody: Encodable {
        let grant_type = "refresh_token"
        let client_id: JiraAPI.Auth.ClientID
        let client_secret: JiraAPI.Auth.ClientSecret
        let refresh_token: JiraAPI.Auth.RefreshToken
        
        /// Body object for token refresh request.
        /// - Parameters:
        ///   - clientID: (required) Set this to the **Client ID** for your app. Find this in Settings
        ///    for your app in the [developer console](https://developer.atlassian.com/console/myapps/).
        ///   - clientSecret: (required) Set this to the **Secret** for your app. Find this in Settings
        ///    for your app in the [developer console](https://developer.atlassian.com/console/myapps/).
        ///   - refreshToken: The refresh token that you obtained with your original access token.
        init(
            clientID: JiraAPI.Auth.ClientID,
            clientSecret: JiraAPI.Auth.ClientSecret,
            refreshToken: JiraAPI.Auth.RefreshToken
        ) {
            self.client_id = clientID
            self.client_secret = clientSecret
            self.refresh_token = refreshToken
        }
    }
}
