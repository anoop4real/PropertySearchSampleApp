//
//  PropertyViewModel.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

struct PropertyViewModel: Equatable {
    let id: String
    let imageURL: URL?
    let price: String
    let addressline1: String
    let addressline2: String
    let livingArea: String
    let numberOfRooms: String
}

extension PropertyViewModel {

    init? (with property: Property) {
        guard let askingPrice = property.askingPrice,
              let streetAddress = property.streetAddress,
              let area = property.area,
              let municipality = property.municipality,
              let livingArea = property.livingArea,
              let id = property.id
        else {
            return nil
        }
        self.id = id
        self.price = PriceFormatter.formatted(from: askingPrice)
        self.addressline1 = streetAddress
        self.addressline2 = "\(area), \(municipality)"
        let meterSquareSymbol = Constants.Symbols.meterSquare
        self.livingArea = "\(livingArea) " + meterSquareSymbol

        if let numberOfRooms = property.numberOfRooms {
            let suffix = numberOfRooms > 1 ? "rooms" : "room"
            self.numberOfRooms = "\(numberOfRooms) " + suffix
        } else {
            self.numberOfRooms = ""
        }
        if let image = property.image, let imageURL = URL(string: image) {
            self.imageURL = imageURL
        } else {
            self.imageURL = nil
        }
    }
}
