//
//  ViewType.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import UIKit
import RxSwift

//MARK: - BaseView Protocol

protocol ViewType: AnyObject {
  associatedtype ViewModelType
  var viewModel: ViewModelType! { get set }
  var disposeBag: DisposeBag! { get set }
  func setupUI()
  func setupEventBinding()
  func setupUIBinding()
}

extension ViewType where Self: UIViewController {
    static func create(with viewModel: ViewModelType) -> Self {
        let `self` = Self()
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        self.loadViewIfNeeded()
        self.setupUI()
        self.setupEventBinding()
        self.setupUIBinding()
        return self
    }
}
