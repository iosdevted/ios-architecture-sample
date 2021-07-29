//
//  ListPresenterTests.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import XCTest
@testable import VIPER_TDD_COREDATA

class ListPresenterTests: XCTestCase {
    
    var mockRouter: MockListRouter?
    var mockView: MockListView?
    var mockInteractor: MockListInteractorInput?
    var presenter: ListPresenter?
    let mockContainer = MockPersistentContainer().container
    var mockCoreDataManager: MockCoreDataManager?
    
    let data1: [String: Any] = [
        TodoKey.id.rawValue: "123",
        TodoKey.title.rawValue: "title",
        TodoKey.completed.rawValue: true
    ]
    let data2: [String: Any] = [
        TodoKey.id.rawValue: "234",
        TodoKey.title.rawValue: "title two",
        TodoKey.completed.rawValue: false
    ]
    
    override func setUpWithError() throws {
        let router = MockListRouter()
        let interactor = MockListInteractorInput()
        
        mockView = MockListView()
        mockRouter = router
        mockInteractor = interactor
        
        presenter = ListPresenter(interactor: interactor, router: router)
        presenter?.view = mockView
        
        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockContainer)
    }
    
    override func tearDownWithError() throws {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }
    
    func testTodoListDidShowCorrectData_WhenPresenterExportedTodoList_ShouldReturnTrue() {
        guard let todo1 = Todo.create(withData: data1, context: mockContainer.viewContext) as? Todo else {       XCTFail("Failed when creating Todo model.")
            return
        }
        
        guard let todo2 = Todo.create(withData: data1, context: mockContainer.viewContext) as? Todo else {       XCTFail("Failed when creating Todo model.")
            return
        }
        
        presenter?.exportedTodoList(todoList: [todo1, todo2])
        
        XCTAssert(mockView?.MockListCalled == 1, "Expect showTodoList called once")
        XCTAssert(presenter?.todoList == [todo1, todo2], "Expected todoList sent is not the same!")
        XCTAssert(presenter?.todoList.count == 2, "Expected todoList count is 2")
    }
}
