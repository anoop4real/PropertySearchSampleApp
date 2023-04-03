//
//  NetworkDataManager.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-27.
//

import Foundation

class NetworkSession {
    static let sharedSession: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30
        let urlSession = URLSession(configuration: .default)
        return urlSession
    }()
}

class NetworkDataManager: NetworkRequestable {
    private var currentTasks = [URLSessionDataTask]()
    func execute(with request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = NetworkSession.sharedSession.dataTask(with: request) { data, _, error in
            if let err = error {
                completion(.failure(err))
                return
            } else if let data = data {
                completion(.success(data))
            } else {
                let err = NSError(domain: "Unknown", code: 0, userInfo: nil)
                completion(.failure(err))
            }
        }
        currentTasks.append(task)
        task.resume()
    }

    func cancellAll() {
        for task in currentTasks {
            task.cancel()
        }
        currentTasks.removeAll()
    }
}
