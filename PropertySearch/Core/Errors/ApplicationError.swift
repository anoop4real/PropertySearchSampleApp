//
//  ApplicationError.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-25.
//

import Foundation

enum ApplicationError: Error {
    // Errors coming from the API Calls
    enum APIError: Error, CustomStringConvertible {
        case unknown
        case generalError(reason: String)
        case forbidden
        case notConnectedToInternet
        case notFound
        case authenticationFailed
        var description: String {
            switch self {
            case .unknown:
                return "Unknown"
            case .generalError(reason: let reason):
                return reason
            case .forbidden:
                return "Forbidden to Access"
            case .notConnectedToInternet:
                return "Not connected to Internet"
            case .notFound:
                return "Resource Not Found"
            case .authenticationFailed:
                return "Authentication Failed"
            }
        }
    }
}
