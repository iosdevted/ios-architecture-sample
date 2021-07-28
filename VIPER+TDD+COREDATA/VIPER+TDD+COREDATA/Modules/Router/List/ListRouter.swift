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
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let navigationController = UINavigationController(rootViewController: view)
        
        presenter.view = view
        view.presenter = presenter
        interactor.presenter = presenter
        
        return navigationController
    }
}
