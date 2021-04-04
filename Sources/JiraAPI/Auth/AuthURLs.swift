//
//  AuthURLs.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

/// JiraAPI Authorization Related `URL`s
public extension JiraAPI.Auth.URL {
    // MARK: - URLs

    /// URL used to get an authorization code
    ///
    /// Use the authorization URL in a GET request. You can get this URL by going to your app in the
    /// [developer console](https://developer.atlassian.com/console/myapps/),
    /// selecting Authorization in the left menu, and selecting Configure next to OAuth 2.0 (3LO). Alternatively,
    /// you can construct the URL manually (for example, if you want to specify scopes from multiple products).
    ///
    /// **Determining the required scopes for an API operation**
    ///
    /// To find out which scope is required for an operation, check the OAuth scopes required field for the operation in
    /// the documentation for the API:
    /// - [Jira platform REST API documentation](https://developer.atlassian.com/cloud/jira/platform/rest)
    /// - [Jira Service Desk REST API documentation](https://developer.atlassian.com/cloud/jira/service-desk/rest)
    /// - [Confluence REST API documentation](https://developer.atlassian.com/cloud/confluence/rest)
    ///
    /// If the operation has the statement Apps can't access this REST resource, you can't use it with OAuth 2.0 (3LO).
    /// Note that an app will always be constrained by the permissions of the user that an app is acting for, regardless
    /// of its scopes. For example, if a Jira app has the manage:jira-configuration scope but user does not have the
    /// Administer Jira permission, then the app will not be able to take Jira administration actions.
    ///
    /// Usage:
    ///
    ///     let authorizeURL = JiraAPI.Auth.authorize(
    ///         clientID: "YOUR_CLIENT_ID",
    ///         scope: ["REQUESTED_SCOPE_ONE", "REQUESTED_SCOPE_TWO"],
    ///         redirectURI: "https://YOUR_APP_CALLBACK_URL",
    ///         userBoundValue: "YOUR_USER_BOUND_VALUE"
    ///     )
    /// - Parameters:
    ///   - clientID: (required) Set this to the Client ID for your app. Find this in Settings for your app in the
    ///   [developer console](https://developer.atlassian.com/console/myapps/).
    ///   - scopes: (required) Set this to the desired scopes: Separate multiple scopes with a space. Only
    ///   choose from the scopes that you have already added to the APIs for your app in the developer console.
    ///   You may specify scopes from multiple products.
    ///   - redirectURI: (required) Set this to the callback URL configured in Authorization for your app in the
    ///   [developer console](https://developer.atlassian.com/console/myapps/).
    ///   - userBoundValue: (required for security) Set this to a value that is associated with the user you are
    ///   directing to the authorization URL, for example, a hash of the user's session ID. Make sure that this is a
    ///   value that cannot be guessed. You may be able to generate and validate this value automatically, if you
    ///   are using an OAuth 2.0 client library or an authentication library with OAuth 2.0 support. For more
    ///   information, including why this parameter is required for security, see
    ///   [What is the state parameter used for?](
    ///   https://developer.atlassian.com/cloud/jira/platform/oauth-2-3lo-apps/#faq3).
    /// - Returns: The authorize endpoint. Use the url parameter to access the url
    static func authorize(
        clientID: JiraAPI.Auth.ClientID,
        scopes: [JiraAPI.Auth.Scope],
        redirectURI: JiraAPI.Auth.RedirectURI,
        userBoundValue: JiraAPI.Auth.UserBoundValue
    ) throws -> URL {
        return try URLComponents(
            path: "/authorize",
            queryItems: [
                URLQueryItem(name: "audience", value: "api.atlassian.com"),
                URLQueryItem(name: "client_id", value: clientID),
                URLQueryItem(name: "scope", value: scopes.joined(separator: " ")),
                URLQueryItem(name: "redirect_uri", value: redirectURI),
                URLQueryItem(name: "state", value: userBoundValue),
                URLQueryItem(name: "response_type", value: "code"),
                URLQueryItem(name: "prompt", value: "consent")
            ]
        ).createURL()
    }

    /// Exchange authorization code for access token
    /// - Returns: Endpoint for access token request
    static func oauthToken() throws -> URL {
        return try URLComponents(path: "/oauth/token").createURL()
    }
}

// MARK: - URLComponents utils

private extension URLComponents {
    init(path: String, queryItems: [URLQueryItem]? = nil) {
        self.init()
        self.scheme = JiraAPI.scheme
        self.host = JiraAPI.Auth.host
        self.path = path
        self.queryItems = queryItems
    }
}
