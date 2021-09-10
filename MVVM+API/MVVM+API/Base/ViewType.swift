//
//  ViewType.swift
//  MVVM+API
//
//  Created by Ted on 2021/09/10.
//

import UIKit

//MARK: - BaseView Protocol

protocol ViewType: AnyObject {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func setupUI()
    func setupEventBinding()
    func setupUIBinding()
}

extension ViewType where Self: UIViewController {
    static func create(with viewModel: ViewModelType) -> Self {
        let `self` = Self()
        self.viewModel = viewModel
        self.loadViewIfNeeded()
        self.setupUI()
        self.setupEventBinding()
        self.setupUIBinding()
        return self
    }
}
