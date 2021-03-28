//
//  OauthTokenResponse.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI {
    struct OauthTokenResponse: Decodable {
        let access_token: JiraAPI.Auth.Token
        let expires_in: Int?
        let refresh_token: JiraAPI.Auth.RefreshToken?
        let scope: JiraAPI.Auth.Scope?
        let token_type: String?
    }
}