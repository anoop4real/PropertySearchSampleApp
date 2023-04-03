//
//  PropertyDetails.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation

final class PropertyDetails: Property {
    let description: String?
    let patio: String?

    enum CodingKeys: String, CodingKey {
        case description
        case patio
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        patio = try values.decodeIfPresent(String.self, forKey: .patio)

        try super.init(from: decoder)
    }
}
