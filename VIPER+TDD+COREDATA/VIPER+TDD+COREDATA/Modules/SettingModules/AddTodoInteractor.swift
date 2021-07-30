//
//  AddTodoInteractor.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import Foundation

protocol AddTodoInteractorInput {
    func addTodoToCoreData(withData data: [String: Any])
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
    func addTodoToCoreData(withData data: [String : Any]) {
        guard let task = data[TodoKey.title.rawValue] as? String else { return }
        
        task.count < 5 ? showMessagewithFailure() : saveCoreDataAndShowMessage(WithData: data)
    }
    
    private func showMessagewithFailure() {
        output?.addTodoFailed(withMessage: "Minimum character task is 5.")
    }
    
    private func saveCoreDataAndShowMessage(WithData data: [String : Any]) {
        guard let newTodo = coreDataManager.create(ofType: Todo.self, withData: data) else {
            output?.addTodoFailed(withMessage: "Add todo failed.")
            return
        }
        coreDataManager.saveContext()
        output?.addTodoSuccess(todo: newTodo)
    }
}
