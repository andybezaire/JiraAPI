//
//  OauthTokenRequestBody.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI.Auth {
    /// - client_id: (required) Set this to the Client ID for your app.
    /// Find this in Settings for your app in the developer console.
    /// - client_secret: (required) Set this to the Secret for your app.
    /// Find this in Settings for your app in the developer console.
    /// - code: (required) Set this to the authorization code received from the
    /// initial authorize call (described above).
    /// - redirect_uri: (required) Set this to the callback URL configured for your app in the developer console.
    struct OauthTokenRequestBody: Encodable {
        let grant_type = "authorization_code"
        let client_id: ClientID
        let client_secret: ClientSecret
        let code: Code
        let redirect_uri: RedirectURI

        init(clientID: ClientID, clientSecret: ClientSecret, code: Code, redirectURI: RedirectURI) {
            self.client_id = clientID
            self.client_secret = clientSecret
            self.code = code
            self.redirect_uri = redirectURI
        }
    }
}
