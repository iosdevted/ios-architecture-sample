//
//  MainViewController.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import UIKit
import RxCocoa
import RxDataSources
import RxSwift

final class NewsViewController: UIViewController, ViewType {
    
    //MARK: UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
        static let tableViewFrame = UIScreen.main.bounds
        static let estimatedRowHeight = CGFloat(80)
    }
    
    //MARK: - Properties
    
    var viewModel: NewsViewModelType!
    var disposeBag: DisposeBag!
    private let tableView = UITableView(frame: UI.tableViewFrame, style: .plain)
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: setupUI
    
    func setupUI() {
        navigationItem.title = "RxNews"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.tintColor = .mainColor
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UI.estimatedRowHeight
        tableView.separatorColor = .mainColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: UI.baseMargin, bottom: 0, right: UI.baseMargin)
        tableView.register(cellType: NewsTableViewCell.self)
        
        indicatorView.color = .mainColor
        indicatorView.center = view.center
        
        view.addSubviews([tableView, indicatorView])
    }
    
    //MARK: Rx Event Binding
    
    func setupEventBinding() {
        rx.viewWillAppear
            .bind(to: viewModel.viewWillAppear)
            .disposed(by: disposeBag)
        
        navigationItem.leftBarButtonItem?.rx.tap
            .bind(to: viewModel.didTapLeftBarButton)
            .disposed(by: disposeBag)
        
        navigationItem.rightBarButtonItem?.rx.tap
            .bind(to: viewModel.didTapRightBarButton)
            .disposed(by: disposeBag)
        
        tableView.refreshControl?.rx.controlEvent(.valueChanged)
            .bind(to: viewModel.didPulltoRefresh)
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(ArticleData.Item.self)
            .bind(to: viewModel.didCellSelected)
            .disposed(by: disposeBag)
    }
    
    //MARK: Rx UI Binding
    
    func setupUIBinding() {
        let dataSource = RxTableViewSectionedReloadDataSource<ArticleData> { (_, tableView, indexPath, item) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: NewsTableViewCell.self)
            cell.configureWith(title: item.title, date: item.publishedAt)
            return cell
        }
        
        
        
    }
}
