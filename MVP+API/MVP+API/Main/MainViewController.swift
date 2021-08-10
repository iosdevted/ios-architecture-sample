//
//  MainViewController.swift
//  MVP+API
//
//  Created by Ted on 2021/08/10.
//

import UIKit

protocol MainViewType: NSObject {
    func startNetworking()
    func stopNetworking()
    func presentAlert(title: String, message: String)
}

final class MainViewController: UIViewController {
    
    //MARK: - UI Metrics
    
    private struct UI {
        static let basicMargin = CGFloat(8)
        static let estimatedRowHeight = CGFloat(60)
    }
    
    //MARK: - Properties
    
    private let presenter: MainPresenterType
    private let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    private let indicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: - Init
    
    init(presenter: MainPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBinding()
        presenter.setView(view: self)
        presenter.onViewDidLoad()
    }
    
    //MARK: - SetupUI
    
    private func setupUI() {
        navigationItem.title = "MVP News"
        
        tableView.refreshControl = UIRefreshControl()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UI.estimatedRowHeight
        tableView.separatorInset = UIEdgeInsets(top: 0, left: UI.basicMargin, bottom: 0, right: UI.basicMargin)
        tableView.register(cell: MainTableViewCell.self)
        indicatorView.center = view.center
        view.addSubviews([tableView, indicatorView])
    }
    
    private func setupBinding() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapLeftBarButtonItem))
        
        //presenter.view = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl?.addTarget(self, action: #selector(didPulltoRefresh), for: .valueChanged)
    }
    
    //MARK: Selectors
    
    @objc private func didTapLeftBarButtonItem() {
        presenter.fetchData()
    }
    
    @objc private func didPulltoRefresh() {
        presenter.fetchData()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(MainTableViewCell.self)!
        presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

//MARK: MainViewControllerProtocol

extension MainViewController: MainViewType {
    func startNetworking() {
        if !tableView.refreshControl!.isRefreshing {
            indicatorView.startAnimating()
        }
    }
    
    func stopNetworking() {
        indicatorView.stopAnimating()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
