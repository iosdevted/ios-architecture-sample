//
//  ListViewTests.swift
//  VIPER+TDD+COREDATATests
//
//  Created by Ted on 2021/07/29.
//

import XCTest
@testable import VIPER_TDD_COREDATA

class ListViewTests: XCTestCase {
    
    let mockContainer = MockPersistentContainer().container
    var mockEventHandler: MockListEventHandler?
    var mockPresenter: ListPresenterProtocol?
    var view: ListViewController?
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
        mockEventHandler = MockListEventHandler()
        view = ListViewController()
        
        mockCoreDataManager = MockCoreDataManager(persistentContainer: mockContainer)
    }

    override func tearDownWithError() throws {
        mockCoreDataManager?.deleteAllData(Todo.entityName())
    }
}
