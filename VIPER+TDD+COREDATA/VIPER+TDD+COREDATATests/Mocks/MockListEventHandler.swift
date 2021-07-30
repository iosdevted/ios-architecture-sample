//
//  MockListEventHandler.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import Foundation
@testable import VIPER_TDD_COREDATA

class MockListEventHandler: ListEventHandler {
    var RequestTodoListCalled = 0
    var ButtonAddClickedCalled = 0
    
    func RequestTodoListCoreData() {
        self.RequestTodoListCalled += 1
    }
    
    func ButtonAddClicked() {
        self.ButtonAddClickedCalled += 1
    }
}
