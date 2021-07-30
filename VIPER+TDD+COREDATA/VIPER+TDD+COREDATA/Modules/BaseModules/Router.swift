//
//  Router.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import UIKit

protocol Router {
    var viewController: UIViewController { get }
}

extension Router {
    var coreDataManager: CoreDataManager {
        guard let coreDataManager = (UIApplication.shared.delegate as? AppDelegate)?.coreDataManager else {
            fatalError("Cannot get core data manager.")
        }
        
        return coreDataManager
    }
}
