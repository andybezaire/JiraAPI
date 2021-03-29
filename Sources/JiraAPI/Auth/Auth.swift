//
//  Auth.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

public extension JiraAPI {
    enum Auth {
        static var host = "auth.atlassian.com"
    }
}

public extension JiraAPI.Auth {
    enum URL {}
    enum Request {}

    typealias ClientID = String
    typealias Scope = String
    typealias RedirectURI = String
    typealias UserBoundValue = String
    typealias Code = String
    typealias ClientSecret = String
    typealias Token = String
    typealias RefreshToken = String
    typealias CloudID = String
}
