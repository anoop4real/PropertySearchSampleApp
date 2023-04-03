//
//  Property.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

class Property: Decodable {
    let type: String?
    let id: String?
    let askingPrice: Int?
    let monthlyFee: Int?
    let municipality: String?
    let area: String?
    let daysSincePublish: Int?
    let livingArea: Int?
    let numberOfRooms: Int?
    let streetAddress: String?
    let image: String?
}
