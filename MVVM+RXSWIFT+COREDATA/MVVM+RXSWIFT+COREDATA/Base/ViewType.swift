//
//  ViewType.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit
import RxSwift

protocol ViewType: AnyObject {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
    var disposeBag: DisposeBag! { get set }
    func setupUI()
    func setupEventBiding()
    func setupUIBinding()
}

extension ViewType where Self: UIViewController {
    static func create(with viewModel: ViewModelType) -> Self {
        let `self` = Self()
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        self.loadViewIfNeeded()
        self.setupUI()
        self.setupEventBiding()
        self.setupUIBinding()
        return self
    }
}
