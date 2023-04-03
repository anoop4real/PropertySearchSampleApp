//
//  RequestProtocol.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

protocol RequestProtocol {
    typealias Parameters = [String: Any]
    var path: String { get }
    var method: String { get }
    var params: Parameters { get }
    func asURLRequest() -> URLRequest?
}

extension RequestProtocol {
    var baseURL: String {
        APIEnvironment.baseURL
    }

    var params: Parameters {
        [:]
    }

    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: baseURL) else {
            return nil
        }
        let urlWithPath = url.appendingPathComponent(path)

        var request = URLRequest(url: urlWithPath)
        request.httpMethod = method
        request.timeoutInterval = TimeInterval(10 * 1000)

        request.setValue(ContentType.json.rawValue,
                         forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)

        if !params.isEmpty {
            do {
                request.httpBody = try JSONSerialization.data(
                    withJSONObject: params)
            } catch {
                return nil
            }
        }
        return request
    }
}
