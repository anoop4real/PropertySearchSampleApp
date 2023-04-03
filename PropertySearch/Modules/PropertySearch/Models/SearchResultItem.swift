//
//  Items.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-28.
//

import Foundation

enum ItemType: String, Decodable {
    case highlightedProperty = "HighlightedProperty"
    case property = "Property"
    case area = "Area"
}

enum SearchResultItem: Decodable {
    private enum CodingKeys: String, CodingKey {
        case type
    }

    case property(Property)
    case highlightedProperty(Property)
    case area(Area)

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let optionalType = try container.decodeIfPresent(ItemType.self, forKey: .type)

        guard let type = optionalType else {
            throw DecodingError.dataCorrupted(.init(codingPath: [CodingKeys.type],
                                                    debugDescription: "type not available",
                                                    underlyingError: nil))
        }

        switch type {
        case .property:
            self = try .property(Property(from: decoder))
        case .highlightedProperty:
            self = try .highlightedProperty(Property(from: decoder))
        case .area:
            self = try .area(Area(from: decoder))
        }
    }
}
