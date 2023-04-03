//
//  PropertyDetailsMockNetworkManager.swift
//  PropertySearchTests
//
//  Created by Anoop M on 2023-04-03.
//

import Foundation

@testable import PropertySearch

class PropertyDetailsMockNetworkManager: NetworkRequestable {
    var shouldSentFail: Bool!

    init(_ shouldSentFail: Bool) {
        self.shouldSentFail = shouldSentFail
    }

    func execute(with request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        if shouldSentFail {
            let json = propertyDetailsFailResponse()
            guard let data = json.data(using: .utf8) else {
                completion(.failure(NSError(domain: "test", code: 500, userInfo: nil)))
                return
            }
            completion(.success(data))

        } else {
            let json = propertyDetailsSuccessResponse()
            guard let data = json.data(using: .utf8) else {
                completion(.failure(NSError(domain: "test", code: 500, userInfo: nil)))
                return
            }
            completion(.success(data))
        }
    }

    func cancellAll() {
        // NA
    }
}
