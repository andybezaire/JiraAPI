# JiraAPI
<p>
  <img src="https://img.shields.io/badge/iOS-14-orange" />
  <img src="https://img.shields.io/badge/MacOS-11-brightgreen" />
  <img src="https://img.shields.io/badge/Swift-5.3-brightgreen.svg" />
  <img src="https://img.shields.io/github/license/andybezaire/JiraAPI" />
  <a href="https://twitter.com/andy_bezaire">
    <img src="https://img.shields.io/twitter/url?url=http%3A%2F%2Fgithub.com%2Fandybezaire%2FJiraAPI=" alt="Twitter: @andy_bezaire" />
  </a>
</p>

Jira's endpoints in a useful form. Includes URLs, URLRequests, and request/response objects.

## Usage

Get a url:

```swift
    let url: URL = try JiraAPI.URL.cloudResources()
```

Get a request:

```swift
    let token = "TOKEN"
    
    let request: URLRequest = try JiraAPI.Request.cloudResources(token: token)
```

## Installation

### Swift Package Manager

Add the following dependency to your **Package.swift** file:

```swift
.package(name: "JiraAPI", url: "https://github.com/andybezaire/JiraAPI.git", from: "1.0.0")
```
## License

"JiraAPI" is available under the MIT license. See the LICENSE file for more info.


## Credit

Copyright (c) 2021 andybezaire

Created by: Andy Bezaire
