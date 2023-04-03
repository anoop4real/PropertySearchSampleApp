//
//  Constants.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-03-29.
//

import Foundation

enum Constants {
    enum Strings {
        // Error Messages
        static let inavalidUrl = "Invalid URL"
        static let failedToFetch = "Failed to fetch data"
        static let failedToProcess = "Could not process data"
        static let enterSearchText = "Please Enter a Search Text"
        static let searchBarPlaceHolder = "Please enter a text to search"
        static let inavalidRequest = "Unable to process the request"
        static let generalErrorTitle = "Error"

        // General
        static let livingAreaAttribute = "Living Area"
        static let numberOfRoomsAttribute = "Number of rooms"
        static let patioAttribute = "Patio"
        static let daysSincePublishAttribute = "Days since publish"
        static let ratingPrefix = "Rating"
        static let averagePrice = "Average price"
        static let area = "Area"

    }

    enum ImageNames {
        static let imagePlaceHolder = "photo"
    }

    enum Symbols {
        static let meterSquare = "m\u{00B2}"
    }
}
