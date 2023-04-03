//
//  PropertyDetailsDataStore.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import UIKit

final class PropertyDetailsDataStore: ResponseHandling {
    private var networkManager: NetworkRequestable?
    private var sections = [SectionType]()

    // MARK: Initializer

    init(with networkManager: NetworkRequestable = NetworkDataManager()) {
        self.networkManager = networkManager
    }

    // MARK: API Calls

    func fetchDetails(identifier: String, completion: @escaping (Result<Void, ApplicationError.APIError>) -> Void) {
        guard let urlRequest = APIEndpoint.propertyDetails(identifier: identifier).asURLRequest() else {
            completion(.failure(.generalError(reason: Constants.Strings.inavalidRequest)))
            return
        }

        networkManager?.execute(with: urlRequest, completion: { [weak self] result in

            if let processedResult = self?.process(response: result, type: PropertyDetails.self) {
                switch processedResult {
                case .success(let propertyDetail):
                    if let detailViewModel = self?.prepareViewModels(from: propertyDetail) {
                        self?.prepareSections(from: detailViewModel)
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

// MARK: Tableview Convenience
extension PropertyDetailsDataStore {
    enum SectionType {
        case imageAddressPrice(addressline1: String,
                               addressline2: String,
                               price: String,
                               imageURL: URL?)
        case description(text: String)
        case attribute(attribute: [PropertyAttribute])
    }

    func numberOfSections() -> Int {
        return sections.count
    }

    func numberOfRowsInSection(section: Int) -> Int {
        switch sections[section] {
        case .imageAddressPrice:
            return 1
        case .description:
            return 1
        case .attribute(let attributes):
            return attributes.count
        }
    }

    func sectionType(for section: Int) -> SectionType {
        return sections[section]
    }
}

private extension PropertyDetailsDataStore {
    func prepareViewModels(from details: PropertyDetails) -> PropertyDetailViewModel? {
        return PropertyDetailViewModel(with: details)
    }

    func prepareSections(from viewModel: PropertyDetailViewModel) {
        sections.append(.imageAddressPrice(addressline1: viewModel.addressline1,
                                           addressline2: viewModel.addressline2,
                                           price: viewModel.price,
                                           imageURL: viewModel.imageURL))
        if let description = viewModel.description {
            sections.append(.description(text: description))
        }
        sections.append(.attribute(attribute: viewModel.propertyAttributes))
    }
}
