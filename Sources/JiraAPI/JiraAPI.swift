//
//  JiraAPI.swift
//
//
//  Created by Andy Bezaire on 28.3.2021.
//

/// This creates all of the `URL`s and `URLRequest`s needed for accessing the Jira API
public enum JiraAPI {
    public static var scheme = "https"
    public static var host = "api.atlassian.com"
    public static var rootPath = "/ex/jira"
    public static var apiRoot = "/rest/api/3"

    public enum URL {}
    public enum Request {}
}
