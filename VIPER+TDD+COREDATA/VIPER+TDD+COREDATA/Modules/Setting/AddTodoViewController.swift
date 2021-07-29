//
//  AddTodoViewController.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: AddTodoEventHandler?
    private var switchCompleted: UISwitch!
    private var textField = CustomTextField(placeholder: "Enter Todo List")
    private var alertView: UIAlertController?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        configureUI()
    }
    
    //MARK: - Selectors
    
    @objc private func cancelButtonTapped() {
        
    }
    
    @objc private func doneButtonTapped() {
        
    }
    
    //MARK: - ConfigureUI
    
    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
    }
    
    private func configureUI() {
        //view.addSubview(textField)
        //view.addSubview(switchCompleted)
    }
}

