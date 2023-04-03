//
//  PropertyDetailsViewModel.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

struct PropertyDetailViewModel {
    let id: String
    let imageURL: URL?
    let price: String
    let addressline1: String
    let addressline2: String
    let description: String?
    let propertyAttributes: [PropertyAttribute]
}

extension PropertyDetailViewModel {

    init? (with property: PropertyDetails) {
        guard let askingPrice = property.askingPrice,
              let streetAddress = property.streetAddress,
              let area = property.area,
              let municipality = property.municipality,
              let id = property.id
        else {
            return nil
        }
        self.id = id
        self.price = PriceFormatter.formatted(from: askingPrice)
        self.addressline1 = streetAddress
        self.addressline2 = "\(area), \(municipality)"
        self.description = property.description
        let meterSquareSymbol = Constants.Symbols.meterSquare

        var attributes = [PropertyAttribute]()
        if let livingArea = property.livingArea {
            // ex: 100 m2
            let formattedLivingArea = "\(livingArea) " + meterSquareSymbol
            let attribute = PropertyAttribute(attributeKey: Constants.Strings.livingAreaAttribute,
                                              attributeValue: formattedLivingArea)
            attributes.append(attribute)
        }
        if let numberOfRooms = property.numberOfRooms {
            let attribute = PropertyAttribute(attributeKey: Constants.Strings.numberOfRoomsAttribute,
                                              attributeValue: "\(numberOfRooms)")
            attributes.append(attribute)
        }
        if let patio = property.patio {
            let attribute = PropertyAttribute(attributeKey: Constants.Strings.patioAttribute,
                                              attributeValue: patio)
            attributes.append(attribute)
        }
        if let daysSincePublish = property.daysSincePublish {
            let attribute = PropertyAttribute(attributeKey: Constants.Strings.daysSincePublishAttribute,
                                              attributeValue: "\(daysSincePublish)")
            attributes.append(attribute)
        }
        self.propertyAttributes = attributes
        if let image = property.image, let imageURL = URL(string: image) {
            self.imageURL = imageURL
        } else {
            self.imageURL = nil
        }
    }
}
