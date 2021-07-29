//
//  MockListInteractorInput.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import Foundation
@testable import VIPER_TDD_COREDATA

class MockListInteractorInput: ListInteractorInputProtocol {
    var getTodoListSuccessCalled = 0
    
    func fetchTodoList() {
        self.getTodoListSuccessCalled += 1
    }

}
