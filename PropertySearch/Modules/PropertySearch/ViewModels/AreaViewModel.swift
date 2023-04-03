//
//  AreaViewModel.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

struct AreaViewModel: Equatable {
    let area: String?
    let rating: String?
    let averagePrice: String?
    let id: String
    let title: String?
    let imageURL: URL?
}

extension AreaViewModel {
    init? (with areaInfo: Area) {
        guard let area = areaInfo.area,
              let ratingFormatted = areaInfo.ratingFormatted,
              let price = areaInfo.averagePrice,
              let id = areaInfo.id
        else {
            return nil
        }
        self.id = id
        self.area = area
        self.rating = "\(Constants.Strings.ratingPrefix): " + ratingFormatted
        let meterSquareSymbol = Constants.Symbols.meterSquare
        self.averagePrice = "\(Constants.Strings.averagePrice): \(PriceFormatter.formatted(from: price)) / \(meterSquareSymbol)"
        self.title = Constants.Strings.area
        if let image = areaInfo.image, let imageURL = URL(string: image) {
            self.imageURL = imageURL
        } else {
            self.imageURL = nil
        }
    }
}
