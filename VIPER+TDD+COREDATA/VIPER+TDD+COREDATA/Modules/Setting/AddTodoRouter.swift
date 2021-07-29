//
//  AddTodoRouter.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import UIKit

class AddTodoRouter: Router {
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
    
    var viewController: UIViewController {
        let view = AddTodoViewController()
        let interactor = AddTodoInteractor(coreDatamanager: coreDataManager)
        let presenter = AddTodoPresenter(interactor: interactor, router: self)
        
        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter
        
        return view
    }
}
