//
//  NetworkRequestable.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-27.
//

import Foundation

protocol NetworkRequestable {
    func execute(with request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
    func cancellAll()
}
