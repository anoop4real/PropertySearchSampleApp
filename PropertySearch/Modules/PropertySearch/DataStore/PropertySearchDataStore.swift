//
//  PropertySearchDataStore.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-29.
//

import UIKit

final class PropertySearchDataStore: ResponseHandling {
    private var networkManager: NetworkRequestable?
    private var itemViewModels = [ItemViewModel]()

    // MARK: Initializer

    init(with networkManager: NetworkRequestable = NetworkDataManager()) {
        self.networkManager = networkManager
    }

    // MARK: API Calls

    func search(completion: @escaping (Result<Void, ApplicationError.APIError>) -> Void) {
        guard let urlRequest = APIEndpoint.propertySearch.asURLRequest() else {
            completion(.failure(.generalError(reason: Constants.Strings.inavalidRequest)))
            return
        }

        networkManager?.execute(with: urlRequest, completion: { [weak self] result in
            if let processedResult = self?.process(response: result, type: SearchResultItemList.self) {
                switch processedResult {
                case .success(let itemList):
                    if let items = itemList.searchResultItems {
                        self?.prepareViewModels(from: items)
                        completion(.success(()))
                    } else {
                        completion(.failure(.generalError(reason: Constants.Strings.failedToFetch)))
                    }

                case .failure(let error):
                    completion(.failure(error))
                }
            }
        })
    }
}

// MARK: TableView Convenience Functions
extension PropertySearchDataStore {

    func numberOfItems() -> Int {
        return itemViewModels.count
    }

    func itemAt(index: Int) -> ItemViewModel {
        return itemViewModels[index]
    }
}

// MARK: Prepare Viewmodels
private extension PropertySearchDataStore {
    private func prepareViewModels(from items: [SearchResultItem]) {
        for item in items {
            switch item {
            case .property(let property):
                if let viewModel = PropertyViewModel(with: property) {
                    itemViewModels.append(.property(viewModel))
                }
            case .highlightedProperty(let property):
                if let viewModel = PropertyViewModel(with: property) {
                    itemViewModels.append(.highlightedProperty(viewModel))
                }
            case .area(let area):
                if let viewModel = AreaViewModel(with: area) {
                    itemViewModels.append(.area(viewModel))
                }
            }
        }
    }
}
