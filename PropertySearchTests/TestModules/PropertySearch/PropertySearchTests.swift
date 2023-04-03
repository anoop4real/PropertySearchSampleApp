//
//  PropertySearchTests.swift
//  PropertySearchTests
//
//  Created by Anoop M on 2023-03-25.
//

import XCTest
@testable import PropertySearch

class PropertySearchTests: XCTestCase {

    var dataStore: PropertySearchDataStore!
    var failDataStore: PropertySearchDataStore!
    override func setUp() {
        dataStore = PropertySearchDataStore(with: PropertySearchMockNetworkManager(false))
        failDataStore = PropertySearchDataStore(with: PropertySearchMockNetworkManager(true))
    }

    override func tearDown () {
        dataStore = nil
        failDataStore = nil
    }

    func testPropertySearchSuccess() {

        let expectation = self.expectation(description: "search")
        dataStore.search { result in
            switch result {
            case .success:
                XCTAssertEqual(self.dataStore.numberOfItems(), 6)
                let firstItem = self.dataStore.itemAt(index: 0)
                if case .highlightedProperty(_) = firstItem {

                } else {
                    XCTFail("This should be highlighted property")
                }
                let secondItem = self.dataStore.itemAt(index: 1)
                if case .property(_) = secondItem {

                } else {
                    XCTFail("This should be a property")
                }

                let thirdItem = self.dataStore.itemAt(index: 2)
                if case .area(_) = thirdItem {

                } else {
                    XCTFail("This should be a property")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertySearchPropertyViewModelSuccess() {

        let expectation = self.expectation(description: "search")
        dataStore.search { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.itemAt(index: 0)
                if case .highlightedProperty(let property) = firstItem {
                    XCTAssertEqual(property, MockData.propertyViewModel())
                } else {
                    XCTFail("This should be highlighted property")
                }
                let secondItem = self.dataStore.itemAt(index: 1)
                if case .property(let property) = secondItem {
                    XCTAssertEqual(property, MockData.propertyViewModel2())
                } else {
                    XCTFail("This should be a property")
                }

                let thirdItem = self.dataStore.itemAt(index: 3)
                if case .property(let property) = thirdItem {
                    XCTAssertEqual(property, MockData.propertyViewModel3())
                } else {
                    XCTFail("This should be a property")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertySearchPropertyViewModelFail() {

        let expectation = self.expectation(description: "search")
        dataStore.search { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.itemAt(index: 0)
                if case .highlightedProperty(let property) = firstItem {
                    XCTAssertNotEqual(property, MockData.propertyViewModel2())
                } else {
                    XCTFail("This should be highlighted property")
                }
            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertySearchAreaViewModelSuccess() {

        let expectation = self.expectation(description: "search")
        dataStore.search { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.itemAt(index: 2)
                if case .area(let area) = firstItem {
                    XCTAssertEqual(area, MockData.areaViewModel())
                } else {
                    XCTFail("This should be an area")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertySearchAreaViewModelFail() {

        let expectation = self.expectation(description: "search")
        dataStore.search { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.itemAt(index: 2)
                if case .area(let area) = firstItem {
                    XCTAssertNotEqual(area, MockData.areaViewModel2())
                } else {
                    XCTFail("This should be an area")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertySearchFailure() {

        let expectation = self.expectation(description: "search")
        failDataStore.search { result in
            switch result {
            case .success:
                XCTFail("Search should fail")
            case .failure(let error):
                XCTAssertEqual(error.description, "Failed to fetch data" )
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

}
