//
//  ListInteractor.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import UIKit

protocol ListInteractorInputProtocol {
    func fetchTodoList()
}

protocol ListInteractorOutputProtocol: AnyObject {
    func exportedTodoList(todoList: [Todo])
}

// MARK: - Class Implementation

class ListInteractor {
    weak var output: ListInteractorOutputProtocol?
    private let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

//MARK: - ListInteractorInputProtocol

extension ListInteractor: ListInteractorInputProtocol {
    func fetchTodoList() {
        let todoList = coreDataManager.fetch(ofType: Todo.self)
        output?.exportedTodoList(todoList: todoList)
    }
}

