//
//  AddTodoInteractor.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import Foundation

protocol AddTodoInteractorInput {
    func addTodo(withData data: [String: Any])
}

protocol AddTodoInteractorOutput: AnyObject {
    func addTodoSuccess(todo: Todo)
    func addTodoFailed(withMessage message: String)
}

class AddTodoInteractor {
    weak var output: AddTodoInteractorOutput?
    private let coreDataManager: CoreDataManager

    init(coreDatamanager: CoreDataManager) {
        self.coreDataManager = coreDatamanager
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

extension AddTodoInteractor: AddTodoInteractorInput {
    func addTodo(withData data: [String : Any]) {
        //
    }
}
