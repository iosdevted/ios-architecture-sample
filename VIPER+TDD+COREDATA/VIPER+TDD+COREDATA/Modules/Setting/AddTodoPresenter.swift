//
//  AddTodoPresenter.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import Foundation

protocol AddTodoEventHandler {
    func addTodoDidClickAdd(withData data: [String: Any])
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
    func addTodoDidClickAdd(withData data: [String : Any]) {
        //
    }
}

extension AddTodoPresenter: AddTodoInteractorOutput {
    func addTodoSuccess(todo: Todo) {
        //
    }
    
    func addTodoFailed(withMessage message: String) {
        //
    }
}
