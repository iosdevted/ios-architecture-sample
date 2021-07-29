//
//  MockListInteractorOutput.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import Foundation
@testable import VIPER_TDD_COREDATA

class MockListInteractorOutput: ListInteractorOutputProtocol {
    var todoList: [Todo]?
    var getTodoListSuccessCalled = 0
    
    func exportedTodoList(todoList: [Todo]) {
        self.todoList = todoList
        self.getTodoListSuccessCalled += 1
    }
}
