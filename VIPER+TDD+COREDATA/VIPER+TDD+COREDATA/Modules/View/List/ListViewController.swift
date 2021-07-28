//
//  ListViewController.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import UIKit

class ListViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: ListPresenter?
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

//MARK: - UITableViewDelegate
