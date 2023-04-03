//
//  MockData.swift
//  PropertySearchTests
//
//  Created by Anoop M on 2023-04-02.
//

import Foundation
@testable import PropertySearch

class MockData {

    static func propertyViewModel() -> PropertyViewModel {
        let vm = PropertyViewModel(id: "1234567890",
                                   imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                                   price: "2\u{00A0}650\u{00A0}000\u{00A0}SEK",
                                   addressline1: "Mockvägen 1",
                                   addressline2: "Heden, Gällivare kommun",
                                   livingArea: "120 \(Constants.Symbols.meterSquare)",
                                   numberOfRooms: "5 rooms")
        return vm
    }

    static func propertyViewModel2() -> PropertyViewModel {
        let vm = PropertyViewModel(id: "1234567891",
                                   imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/8/8f/Arkitekt_Peder_Magnussen_hus_H%C3%B8nefoss_HDR.jpg"),
                                   price: "6\u{00A0}950\u{00A0}000\u{00A0}SEK",
                                   addressline1: "Mockvägen 2",
                                   addressline2: "Nedre Gärdet, Stockholm",
                                   livingArea: "85 \(Constants.Symbols.meterSquare)",
                                   numberOfRooms: "3 rooms")
        return vm
    }

    static func propertyViewModel3() -> PropertyViewModel {
        let vm = PropertyViewModel(id: "1234567893",
                                   imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Bertha_Petterssons_hus_01.jpg/800px-Bertha_Petterssons_hus_01.jpg"),
                                   price: "1\u{00A0}150\u{00A0}000\u{00A0}SEK",
                                   addressline1: "Mockvägen 4",
                                   addressline2: "Kvarngärdet, Uppsala kommun",
                                   livingArea: "29 \(Constants.Symbols.meterSquare)",
                                   numberOfRooms: "1 room")
        return vm
    }

    static func areaViewModel () -> AreaViewModel {

        let vm = AreaViewModel(area: "Stockholm",
                               rating: "\(Constants.Strings.ratingPrefix): 4.5/5",
                               averagePrice: "\(Constants.Strings.averagePrice): 50\u{00A0}100\u{00A0}SEK / \(Constants.Symbols.meterSquare)",
                               id: "1234567892",
                               title: "Area",
                               imageURL: URL(string: "https://i.imgur.com/v6GDnCG.png"))
        return vm
    }

    // With Format error
    static func areaViewModel2 () -> AreaViewModel {

        let vm = AreaViewModel(area: "Stockholm",
                               rating: "\(Constants.Strings.ratingPrefix):4.5/5",
                               averagePrice: "\(Constants.Strings.averagePrice): 50\u{00A0}100\u{00A0}SEK /\(Constants.Symbols.meterSquare)",
                               id: "1234567892",
                               title: "Area",
                               imageURL: URL(string: "https://i.imgur.com/v6GDnCG.png"))
        return vm
    }

    static func propertyDetailViewModel() -> PropertyDetailViewModel {

        let vm = PropertyDetailViewModel(id: "1234567890",
                                         imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                                         price: "2\u{00A0}650\u{00A0}000\u{00A0}SEK",
                                         addressline1: "Mockvägen 1",
                                         addressline2: "Heden, Gällivare kommun",
                                         description: "The living room can be furnished according to your own wishes and tastes, here the whole family can gather and enjoy each other's company. From the living room you reach the terrace overlooking the lush courtyard which is located in undisturbed and secluded location.",
                                         propertyAttributes: [PropertyAttribute(attributeKey: Constants.Strings.livingAreaAttribute,
                                                                                attributeValue: "120 \(Constants.Symbols.meterSquare)"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.numberOfRoomsAttribute,
                                                                                attributeValue: "5"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.patioAttribute,
                                                                                attributeValue: "Yes"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.daysSincePublishAttribute,
                                                                                attributeValue: "1")])
        return vm
    }

    static func propertyDetailViewModelFailed() -> PropertyDetailViewModel {

        let vm = PropertyDetailViewModel(id: "123456789",
                                         imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5b/Hus_i_svarttorp.jpg/800px-Hus_i_svarttorp.jpg"),
                                         price: "2\u{00A0}650\u{00A0}000\u{00A0}",
                                         addressline1: "Mockvägen ",
                                         addressline2: "Heden",
                                         description: "The living room can be furnished according to your own wishes and tastes, here the whole family can gather and enjoy each other's company. From the living room you reach the terrace overlooking the lush courtyard which is located in undisturbed.",
                                         propertyAttributes: [PropertyAttribute(attributeKey: Constants.Strings.livingAreaAttribute,
                                                                                attributeValue: "120"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.numberOfRoomsAttribute,
                                                                                attributeValue: "5"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.patioAttribute,
                                                                                attributeValue: "Yes"),
                                                              PropertyAttribute(attributeKey: Constants.Strings.daysSincePublishAttribute,
                                                                                attributeValue: "1")])
        return vm
    }
}
