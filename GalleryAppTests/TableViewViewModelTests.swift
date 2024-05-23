//
//  TableViewViewModelTests.swift
//  GalleryAppTests
//
//  Created by Ashok Narvaneni on 17/02/24.
//

import XCTest
@testable import GalleryApp

final class TableViewViewModelTests: XCTestCase {
    
    var viewModel: TableViewViewModel!
    var mockApiServcie: MockApiService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockApiServcie = MockApiService()
        viewModel = TableViewViewModel(apiService: mockApiServcie)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockApiServcie = nil
        viewModel = nil
        super.tearDown()
    }

    func testGetProductsData() throws {
        let products = [
            Products(id: 1, title: "Test", price: 102, desc: "Test Des", category: "Mens", imageUrl: "https://google.com", rating: nil),
            Products(id: 2, title: "Test2", price: 104, desc: "Test Des4", category: "Mens", imageUrl: "https://google.com", rating: nil)]
        
        mockApiServcie.shouldReturnError = false
        mockApiServcie.mockProducts = products
        let expectations = self.expectation(description: "Check products count is equal to 2 or not")
        
        viewModel.updateViewWithData = {
            XCTAssertEqual(self.viewModel.tempProductsArray.count, 2, "Success")
            expectations.fulfill()
        }
        
        viewModel.fetchProductsData()
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetProductsFailure() throws {
        mockApiServcie.shouldReturnError = true
        viewModel.fetchProductsData()
        XCTAssertTrue(viewModel.tempProductsArray.isEmpty, "Checking for empty")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
