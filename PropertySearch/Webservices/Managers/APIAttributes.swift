//
//  APIAttributes.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case requestName = "RequestName"
}

enum APIMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
}

enum ContentType: String {
    case json = "application/json"
    case url = "application/x-www-form-urlencoded; charset=utf-8"
}
