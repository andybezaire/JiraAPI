//
//  JiraAPI.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

/// This creates all of the `URL`s and `URLRequest`s needed for accessing the Jira API
public enum JiraAPI {}

public extension JiraAPI {
    static var scheme = "https"
    static var host = "api.atlassian.com"
    static var rootPath = "/ex/jira"
    static var apiRoot = "/rest/api/3"

    enum URL {}
    enum Request {}
    enum Models {}
}
