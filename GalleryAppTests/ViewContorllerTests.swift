//
//  ViewContorllerTests.swift
//  GalleryAppTests
//
//  Created by Ashok Narvaneni on 17/02/24.
//

import XCTest
@testable import GalleryApp

final class ViewContorllerTests: XCTestCase {
    
    var viewController: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        viewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
    }
    
    func testCheckIBoutletsAreConnected() throws {
        _ = try XCTUnwrap(viewController.tableView, "TableView is not connected to IBOutlet")
    }
    
    func testSetUpUI() throws {
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)
    }
    
    func testViewControllerAsTableView() throws {
        XCTAssertNotNil(viewController.tableView, "TableView is not available")
    }
    
    func testViewControllerConfirmsToDataSource() throws {
        XCTAssertTrue(viewController.conforms(to: UITableViewDataSource.self), "View does not conform to the protocol")
    }
    
//    func testCellForRowIndexIsAvailable() throws {
//        let indexpath = IndexPath(row: 0, section: 0)
//        let tableViewCell = viewController.tableView(viewController.tableView, cellForRowAt: indexpath) as? CustomTableViewCell
//        XCTAssertTrue(tableViewCell?.reuseIdentifier == "dataCell", "TableViewCell Identifier is not equal")
//    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}
