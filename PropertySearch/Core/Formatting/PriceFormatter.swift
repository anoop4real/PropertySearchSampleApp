//
//  File.swift
//  PropertySearch
//
//  Created by Anoop M on 2023-04-01.
//

import Foundation

final class PriceFormatter {
    static func formatted(from price: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "SEK"
        formatter.locale = Locale(identifier: "sv_SE")
        formatter.minimumFractionDigits = 0
        let formattedPrice = formatter.string(from: NSNumber(value: price))
        return formattedPrice ?? "-"
    }
}
