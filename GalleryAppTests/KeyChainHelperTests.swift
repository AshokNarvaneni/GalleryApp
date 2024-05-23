//
//  KeyChainHelperTests.swift
//  GalleryAppTests
//
//  Created by Ashok Narvaneni on 01/03/24.
//

import XCTest
@testable import GalleryApp

final class KeyChainHelperTests: XCTestCase {
    
    let sharedHelper = KeyChainHelper.sharedHelper

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let service = KeyChainConstants.accessToken
        let account = KeyChainConstants.account
        var token = "t732667yhvdjysg872r682426"
        let data = Data(token.utf8)
        
        var value = sharedHelper.saveAndUpdateTheItem(data: data, service: service, account: account)
        
        XCTAssertTrue(value, "Token not Saved successfully")
        
        token = "987654321abcdefgh"
        let newData = Data(token.utf8)
        
        value = sharedHelper.saveAndUpdateTheItem(data: newData, service: service, account: account)
        XCTAssertTrue(value, "Token not Updated successfully")
        
        let storedData = sharedHelper.getTheItem(service: service, account: account)
        
        guard let dataIS = storedData else {
           return XCTAssertThrowsError("Fetching the data from keychain is failed")
        }
        let valueString = String(data: dataIS, encoding: .utf8)
        XCTAssertEqual(valueString, token, "Saved token and fetched token both are not same")
        
        value = sharedHelper.deleteTheItem(service: service, account: account)
        XCTAssertTrue(value, "Delete the saved token in keychain is failed")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSaveAndUpdateTheItem() throws {
//        let service = KeyChainConstants.accessToken
//        let account = KeyChainConstants.account
//        let token = "t732667yhvdjysg872r682426"
//        let data = Data(token.utf8)
//        
//        let value = sharedHelper.saveAndUpdateTheItem(data: data, service: service, account: account)
//        
//        XCTAssertTrue(value, "Token not Saved successfully")
    }
    
    func testSaveAndUpdatetheItemFailCase() throws {
//        let service = KeyChainConstants.accessToken
//        let account = KeyChainConstants.account
//        let token = "864873658754358"
//        let data = Data(token.utf8)
        
//        let value = sharedHelper.saveAndUpdateTheItem(data: data, service: service, account: account)
//        
//        XCTAssertFalse(value, "Checking for fail case")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
