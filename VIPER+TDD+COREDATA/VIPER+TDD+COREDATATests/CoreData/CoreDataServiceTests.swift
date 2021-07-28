//
//  TodoTests.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/28.
//

import XCTest
@testable import VIPER_TDD_COREDATA

class CoreDataServiceTests: XCTestCase {
    let mockPersistentContainer = MockPersistentContainer()
    var mockCoreDataManager: MockCoreDataManager?
    
    let data: [String: Any] = [
        TodoKey.id.rawValue: "123",
        TodoKey.title.rawValue: "abcd",
        TodoKey.completed.rawValue: false
    ]
    
    override func setUpWithError() throws {
        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockPersistentContainer.container)
    }
    
    override func tearDownWithError() throws {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }
    
    func testCreateTodoModel_WhenDataProvided_ShouldReturnTrue() {
        
        let context = mockPersistentContainer.container.viewContext
        
        guard let todo = Todo.create(withData: data, context: context) as? Todo else {
            XCTFail("Expected Todo Model")
            return
        }
        
        XCTAssert(todo.id == "123", "Expect created todo id is 123")
        XCTAssert(todo.title == "abcd", "Expect created todo title is abcd")
        XCTAssert(todo.completed == false, "Expect created todo completed is false")
    }
    
    func testUpdateTodoValue_WhenDataIsEmpty_ShouldReturnTrue() {
        guard let emptyTodo = mockCoreDataManager?.create(ofType: Todo.self, withData: nil) else {
            XCTFail("Expected Created todo model")
            return
        }
        
        emptyTodo.update(withData: data)
        
        XCTAssert(emptyTodo.id == "123", "Expect created todo id is 123")
        XCTAssert(emptyTodo.title == "abcd", "Expect created todo title is abcd")
        XCTAssert(emptyTodo.completed == false, "Expect created todo completed is false")
        
    }
    
}
