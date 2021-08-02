//
//  AddTodoViewController.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

import UIKit

protocol AddTodoViewControllerProtocol {
    func showAlert(withMessage message: String, animated: Bool)
}

class AddTodoViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: AddTodoEventHandler?
    var switchCompleted = UISwitch()
    var textField = CustomTextField(placeholder: "Enter Todo List")
    private var alertView: UIAlertController?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupUI()
    }
    
    //MARK: - Selectors
    
    @objc private func cancelButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func doneButtonTapped() {
        presenter?.addTodoData()
    }
    
    @objc func switchStateDidChange(_ sender: UISwitch!)
    {
        sender.isOn ? print("UISwitch state is now ON") : print("UISwitch state is now Off")
    }
    
    //MARK: - ConfigureUI
    
    private func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubviews([textField, switchCompleted])
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        switchCompleted.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchCompleted.setOn(false, animated: false)
        switchCompleted.translatesAutoresizingMaskIntoConstraints = false
        switchCompleted.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        switchCompleted.rightAnchor.constraint(equalTo: textField.leftAnchor, constant: -10).isActive = true
        
    }
}

extension AddTodoViewController: AddTodoViewControllerProtocol {
    func showAlert(withMessage message: String, animated: Bool) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertView = alert

        present(alert, animated: animated, completion: nil)
    }
}
