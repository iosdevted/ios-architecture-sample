//
//  ListInteractorTests.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import XCTest
@testable import VIPER_TDD_COREDATA

class ListInteractorTests: XCTestCase {
    
    var mockCoreDataManager: MockCoreDataManager?
    var mockOutput: MockListInteractorOutput?
    var interactor: ListInteractor?
    
    private let data1: [String: Any] = [
        TodoKey.id.rawValue: "123",
        TodoKey.title.rawValue: "Todo one",
        TodoKey.completed.rawValue: true
    ]
    
    private let data2: [String: Any] = [
        TodoKey.id.rawValue: "234",
        TodoKey.title.rawValue: "Todo two",
        TodoKey.completed.rawValue: false
    ]
    
    override func setUpWithError() throws {
        let coreDataManager = MockCoreDataManager(persistentContainer: MockPersistentContainer().container)
        
        mockOutput = MockListInteractorOutput()
        mockCoreDataManager = coreDataManager
        
        interactor = ListInteractor(coreDataManager: coreDataManager)
        interactor?.output = mockOutput
    }
    
    override func tearDownWithError() throws {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }
    
    func testGetTodoList_whenInteractorDemand_ShouldReturnTrue() {
        guard let todo1 = mockCoreDataManager?.create(ofType: Todo.self, withData: data1) else { XCTFail("Failed creating Todo model")
            return
        }
        
        guard let todo2 = mockCoreDataManager?.create(ofType: Todo.self, withData: data2) else { XCTFail("Failed creating Todo model")
            return
        }
        
        interactor?.fetchTodoList()
        
        XCTAssert(mockOutput?.getTodoListSuccessCalled == 1,
                  "Expect getTodoListSuccess called once")
        XCTAssert(mockOutput?.todoList?.contains(todo1) ?? false,
                  "Ouput doesn't contain expected value todo1")
        XCTAssert(mockOutput?.todoList?.contains(todo2) ?? false,
                  "Ouput doesn't contain expected value todo2")
    
    }
}
