//
//  ListTestTests.swift
//  ListTestTests
//
//  Created by Wahid on 30/06/22.
//

import XCTest
@testable import ListTest

class ListTestTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let manager = TodoListMagager.emptyState()
        
        XCTAssertTrue(manager.items.count == 0, "should start with empty list of todo's")
    }

}
