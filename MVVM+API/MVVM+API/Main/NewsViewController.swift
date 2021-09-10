//
//  NewsViewController.swift
//  MVVM+API
//
//  Created by Ted on 2021/09/10.
//

import UIKit

class NewsViewController: UIViewController, ViewType {
    
    //MARK: UI Metrics
    
    private struct UI {
        static let baseMargin = CGFloat(8)
        static let tableViewFrame = UIScreen.main.bounds
        static let estimatedRowHeight = CGFloat(160)
    }
    
    //MARK: - Properties
    
    var viewModel: NewsViewModelType!
    private let tableView = UITableView(frame: UI.tableViewFrame, style: .plain)
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: - setupUI
    
    func setupUI() {
        navigationItem.title = "MVVM News"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)
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
    
    //MARK: -> Rx Event Binding
    
    func setupEventBinding() {
        
    }
    
    //MARK: <- Rx UI Binding
    
    func setupUIBinding() {
        
    }
    
    //MARK: - Action Handler
    
    private func showNetworkingAnimation(_ isNetworking: Bool) {
        if !isNetworking {
            indicatorView.stopAnimating()
            tableView.refreshControl?.endRefreshing()
        } else if !tableView.refreshControl!.isRefreshing {
            indicatorView.stopAnimating()
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}
