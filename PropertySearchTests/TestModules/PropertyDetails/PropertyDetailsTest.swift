//
//  PropertyDetailsTest.swift
//  PropertySearchTests
//
//  Created by Anoop M on 2023-04-03.
//

@testable import PropertySearch
import XCTest

final class PropertyDetailsTest: XCTestCase {
    var dataStore: PropertyDetailsDataStore!
    var failDataStore: PropertyDetailsDataStore!

    override func setUp() {
        dataStore = PropertyDetailsDataStore(with: PropertyDetailsMockNetworkManager(false))
        failDataStore = PropertyDetailsDataStore(with: PropertyDetailsMockNetworkManager(true))
    }

    override func tearDown() {
        dataStore = nil
        failDataStore = nil
    }

    func testPropertyDetailsSuccess() {
        let expectation = self.expectation(description: "details")

        dataStore.fetchDetails(identifier: "test") { result in
            switch result {
            case .success:
                XCTAssertEqual(self.dataStore.numberOfSections(), 3)
                let firstItem = self.dataStore.sectionType(for: 0)
                if case .imageAddressPrice = firstItem {
                } else {
                    XCTFail("This should be image and address section")
                }
                let secondItem = self.dataStore.sectionType(for: 1)
                if case .description = secondItem {
                } else {
                    XCTFail("This should be a description")
                }

                let thirdItem = self.dataStore.sectionType(for: 2)
                if case .attribute = thirdItem {
                } else {
                    XCTFail("This should be an attributes")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertyDetailsFailure() {

        let expectation = self.expectation(description: "details")
        failDataStore.fetchDetails(identifier: "test") { result in
            switch result {
            case .success:
                XCTFail("Details should fail")
            case .failure(let error):
                XCTAssertEqual(error.description, "Failed to fetch data" )
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertyDetailsViewModelSuccess() {
        let expectation = self.expectation(description: "details")
        let expectedViewModel = MockData.propertyDetailViewModel()
        dataStore.fetchDetails(identifier: "test") { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.sectionType(for: 0)
                if case .imageAddressPrice(let addressline1,
                                           let addressline2 ,
                                           let price,
                                           let imageURL) = firstItem {
                    XCTAssertEqual(addressline1, expectedViewModel.addressline1, "Wrong addresline 1")
                    XCTAssertEqual(addressline2, expectedViewModel.addressline2, "Wrong addresline 2")
                    XCTAssertEqual(price, expectedViewModel.price, "Wrong price")
                    XCTAssertEqual(imageURL, expectedViewModel.imageURL, "Wrong imageURL")

                } else {
                    XCTFail("This should be image and address section")
                }

                let secondItem = self.dataStore.sectionType(for: 1)
                if case .description(let description) = secondItem {
                    XCTAssertEqual(description, expectedViewModel.description, "Wrong description")
                } else {
                    XCTFail("This should be a description")
                }

                let thirdItem = self.dataStore.sectionType(for: 2)
                if case .attribute(let attributes) = thirdItem {
                    XCTAssertEqual(attributes, expectedViewModel.propertyAttributes, "Wrong attributes")
                } else {
                    XCTFail("This should be an attributes")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }

    func testPropertyDetailsViewModelFailure() {
        let expectation = self.expectation(description: "details")
        let expectedViewModel = MockData.propertyDetailViewModelFailed()
        dataStore.fetchDetails(identifier: "test") { result in
            switch result {
            case .success:
                let firstItem = self.dataStore.sectionType(for: 0)
                if case .imageAddressPrice(let addressline1,
                                           let addressline2 ,
                                           let price,
                                           let imageURL) = firstItem {
                    XCTAssertNotEqual(addressline1, expectedViewModel.addressline1, "Wrong addresline 1")
                    XCTAssertNotEqual(addressline2, expectedViewModel.addressline2, "Wrong addresline 2")
                    XCTAssertNotEqual(price, expectedViewModel.price, "Wrong price")
                    XCTAssertNotEqual(imageURL, expectedViewModel.imageURL, "Wrong imageURL")

                } else {
                    XCTFail("This should be image and address section")
                }

                let secondItem = self.dataStore.sectionType(for: 1)
                if case .description(let description) = secondItem {
                    XCTAssertNotEqual(description, expectedViewModel.description, "Wrong description")
                } else {
                    XCTFail("This should be a description")
                }

                let thirdItem = self.dataStore.sectionType(for: 2)
                if case .attribute(let attributes) = thirdItem {
                    XCTAssertNotEqual(attributes, expectedViewModel.propertyAttributes, "Wrong attributes")
                } else {
                    XCTFail("This should be an attributes")
                }

            case .failure:
                XCTFail("Search should succeed")
            }
            expectation.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
}
