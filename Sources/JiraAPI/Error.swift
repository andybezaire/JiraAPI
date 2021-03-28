//
//  Error.swift
//  
//
//  Created by Andy Bezaire on 28.3.2021.
//

import Foundation

extension JiraAPI {
    enum Error: Swift.Error {
        case malformedURL(URLComponents?)
    }
}
