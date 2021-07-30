//
//  AddTodoPresenter.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import Foundation

protocol AddTodoEventHandler {
    func addTodoData()
}

class AddTodoPresenter {
    weak var view: AddTodoViewController?
    let interactor: AddTodoInteractorInput
    let router: AddTodoRouter

    init(interactor: AddTodoInteractorInput, router: AddTodoRouter) {
        self.interactor = interactor
        self.router = router
    }

    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

extension AddTodoPresenter: AddTodoEventHandler {
    func addTodoData() {
        var data = [String: Any]()
        guard let task = view?.textField.text else { return }
        
        data[TodoKey.id.rawValue] = NSUUID().uuidString
        data[TodoKey.title.rawValue] = task
        data[TodoKey.completed.rawValue] = view?.switchCompleted.isOn
        
        interactor.addTodoToCoreData(withData: data)
    }
}

extension AddTodoPresenter: AddTodoInteractorOutput {
    func addTodoSuccess(todo: Todo) {
        view?.showAlert(withMessage: "Add todo success with id \(todo.id ?? "").",
            animated: true)
    }
    
    func addTodoFailed(withMessage message: String) {
        view?.showAlert(withMessage: message, animated: true)
    }
}
