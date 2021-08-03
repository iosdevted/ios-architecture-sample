//
//  SettingViewController.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit
import RxCocoa
import RxSwift

final class SettingViewController: UIViewController, ViewType {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
        static let textFieldWidth = CGFloat(250)
        static let textFieldHeight = CGFloat(40)
    }
    
    //MARK: - Properties
    
    var disposeBag: DisposeBag!
    var viewModel: SettingViewModelType!
    private var switchCompleted = UISwitch()
    private var textField = UITextField()
    private var alertView: UIAlertController?
    
    func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)
        
        view.addSubviews([textField, switchCompleted])
        textField.borderStyle = .line
        textField.textColor = .mainColor
        
        textField
            .centerYAnchor(to: view.centerYAnchor)
            .centerXAnchor(to: view.centerXAnchor)
            .widthAnchor(constant: UI.textFieldWidth)
            .heightAnchor(constant: UI.textFieldHeight)
            .activateAnchors()
        
        switchCompleted.setOn(false, animated: false)
        switchCompleted
            .centerYAnchor(to: view.centerYAnchor)
            .trailingAnchor(to: textField.leadingAnchor, constant: -UI.baseMargin)
            .activateAnchors()
    }
    
    func setupEventBiding() {
        switchCompleted.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.didSwitchValueChanged)
            .disposed(by: disposeBag)
    }
    
    func setupUIBinding() {
        
    }
}

