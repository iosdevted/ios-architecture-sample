//
//  ListViewController.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func reloadTableView()
}

class ListViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: ListPresenter?
    private let tableView = UITableView()
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.ListViewDidRequestTodoList()
    }
    
    //MARK: - Selectors
    
    @objc func addTapped() {
        presenter?.ButtonAddClicked()
    }
    
    //MARK: - ConfigureUI
    
    private func configureNavBar(){
        navigationItem.title = "VIPER Todo"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: ListTableViewCell.self)
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

//MARK: - ListViewControllerProtocol

extension ListViewController: ListViewControllerProtocol {
    @objc func reloadTableView() {
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectTableViewRowAt(indexPath: indexPath)
    }
}

//MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRowsInSection = presenter?.numberOfRows(in: section) else { return 0 }
        return numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ListTableViewCell.self)
        presenter?.configureCell(cell, forRowAt: indexPath)
        return cell
    }
}
