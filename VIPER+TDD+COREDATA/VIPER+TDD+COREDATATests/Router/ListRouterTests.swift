//
//  ListRouterTests.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import XCTest
@testable import VIPER_TDD_COREDATA

class ListRouterTests: XCTestCase {

    var router = ListRouter()
    
    func testNavigationController_ShouldReturnTrue() {
        guard let navController = router.viewController as? UINavigationController else {
            XCTFail("Expect navigation controller type")
            return
        }
        
        guard let view = navController.viewControllers.first as? ListViewController else {
            XCTFail("Expect root view is ListViewController.")
            return
        }
        
        router.pushAddTodoListViewController(from: view, animated: false)
        
        XCTAssert(navController.viewControllers.last is AddTodoViewController, "Expect pushed view is AddTodoViewController")
        
    }

}
