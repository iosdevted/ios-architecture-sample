//
//  ListRouter.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import UIKit

class ListRouter: Router {
    var viewController: UIViewController {
        let view = ListViewController()
        let interactor = ListInteractor(coreDataManager: coreDataManager)
        let presenter = ListPresenter(interactor: interactor, router: self)
        let navigationController = UINavigationController(rootViewController: view)
        
        presenter.view = view
        view.presenter = presenter
        interactor.output = presenter
        
        return navigationController
    }
    
    func pushAddTodoListViewController(from view: UIViewController?, animated: Bool) {
        let addTodoRouter = AddTodoRouter()

        view?.navigationController?.pushViewController(addTodoRouter.viewController,
                                                       animated: animated)
        
    }
}
