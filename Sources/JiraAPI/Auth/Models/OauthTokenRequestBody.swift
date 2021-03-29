//
//  OauthTokenRequestBody.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI.Auth.Models {
    /// - client_id: (required) Set this to the Client ID for your app.
    /// Find this in Settings for your app in the developer console.
    /// - client_secret: (required) Set this to the Secret for your app.
    /// Find this in Settings for your app in the developer console.
    /// - code: (required) Set this to the authorization code received from the
    /// initial authorize call (described above).
    /// - redirect_uri: (required) Set this to the callback URL configured for your app in the developer console.
    struct OauthTokenRequestBody: Encodable {
        let grant_type = "authorization_code"
        let client_id: JiraAPI.Auth.ClientID
        let client_secret: JiraAPI.Auth.ClientSecret
        let code: JiraAPI.Auth.Code
        let redirect_uri: JiraAPI.Auth.RedirectURI

        init(clientID: JiraAPI.Auth.ClientID,
             clientSecret: JiraAPI.Auth.ClientSecret,
             code: JiraAPI.Auth.Code,
             redirectURI: JiraAPI.Auth.RedirectURI)
        {
            self.client_id = clientID
            self.client_secret = clientSecret
            self.code = code
            self.redirect_uri = redirectURI
        }
    }
}
