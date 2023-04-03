//
//  PriceFormatterTest.swift
//  PropertySearchTests
//
//  Created by Anoop M on 2023-04-03.
//

@testable import PropertySearch
import XCTest

final class PriceFormatterTest: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPriceFormatterSuccess() throws {
        let expectedFormattedPrice = "2\u{00A0}650\u{00A0}000\u{00A0}SEK"

        let formattedPrice = PriceFormatter.formatted(from: 2650000)
        XCTAssertEqual(expectedFormattedPrice, formattedPrice)
    }
}
