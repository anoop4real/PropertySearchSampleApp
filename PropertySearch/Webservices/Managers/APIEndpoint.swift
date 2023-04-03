//
//  APIManager.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-27.
//

import Foundation

enum APIEndpoint: RequestProtocol {
    case propertySearch
    case propertyDetails(identifier: String)

    var method: String {
        switch self {
        case .propertySearch, .propertyDetails:
            return APIMethods.get.rawValue
        }
    }

    var path: String {
        switch self {
        case .propertySearch:
            return "/nH5NinBi"
        case .propertyDetails(let identifier):
            return "/\(identifier)"
        }
    }
}
