//
//  MainViewController.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit
import RxCocoa
import RxSwift

final class MainViewController: UIViewController, ViewType {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
        static let tableViewFrame = UIScreen.main.bounds
        static let estimatedRowHeight = CGFloat(160)
    }
    
    //MARK: - Properties
    
    var viewModel: MainViewModelType!
    var disposeBag: DisposeBag!
    private let tableView = UITableView(frame: UI.tableViewFrame, style: .plain)
    
    //MARK: - setupUI
    
    func setupUI() {
        navigationItem.title = "RxTodo"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UI.estimatedRowHeight
        tableView.separatorColor = .mainColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: UI.baseMargin, bottom: 0, right: UI.baseMargin)
        tableView.register(cellType: MainTableViewCell.self)
        view.addSubview(tableView)
    }
    
    //MARK: -> Rx Event Binding
    
    func setupEventBiding() {
        rx.viewWillAppear
            .bind(to: viewModel.viewWillAppear)
            .disposed(by: disposeBag)
        
        navigationItem.rightBarButtonItem?.rx.tap
            .bind(to: viewModel.didTapRightBarButton)
            .disposed(by: disposeBag)
    }
    
    //MARK: <- Rx UI Binding
    
    func setupUIBinding() {
        
        
        // Navigation
        
        viewModel.editSetting
            .drive(onNext: { [weak self] viewModel in
                let view = SettingViewController.create(with: viewModel)
                self?.navigationController?.pushViewController(view, animated: true)
            }).disposed(by: disposeBag)
    }
}
