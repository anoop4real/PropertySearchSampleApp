//
//  ItemList.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-28.
//

import Foundation

struct SearchResultItemList: Decodable {
    let searchResultItems: [SearchResultItem]?

    enum CodingKeys: String, CodingKey {
        case searchResultItems = "items"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        searchResultItems = try values.decodeIfPresent([SearchResultItem].self,
                                                       forKey: .searchResultItems)
    }
}
