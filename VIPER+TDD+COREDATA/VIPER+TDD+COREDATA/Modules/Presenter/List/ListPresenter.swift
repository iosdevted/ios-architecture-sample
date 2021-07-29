//
//  ListPresenter.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/28.
//

import Foundation

protocol ListPresenterProtocol {
    func numberOfRows(in section: Int) -> Int
    func configureCell(_ cell: ListTableViewCellProtocol, forRowAt indexPath: IndexPath)
    func didSelectTableViewRowAt(indexPath: IndexPath)
}

protocol ListEventHandler {
    func ListViewDidRequestTodoList()
    func ButtonAddClicked()
}

// MARK: - Class Implementation

class ListPresenter {
    weak var view: ListViewController?
    let router: ListRouter?
    let interactor: ListInteractorInputProtocol?
    var todoList = [Todo]()
    
    init(interactor: ListInteractorInputProtocol, router: ListRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    deinit {
        debugPrint(String(describing: self), "deinit")
    }
}

//MARK: - ListEventHandler

extension ListPresenter: ListEventHandler {
    func ListViewDidRequestTodoList() {
        interactor?.fetchTodoList()
    }
    
    func ButtonAddClicked() {
        print("push to anoter view controller")
    }
}

//MARK: - ListInteractorOutputProtocol

extension ListPresenter: ListInteractorOutputProtocol {
    func exportedTodoList(todoList: [Todo]) {
        self.todoList = todoList
        view?.reloadTableView()
    }
}

//MARK: - ListPresenterProtocol

extension ListPresenter: ListPresenterProtocol {
    func numberOfRows(in section: Int) -> Int {
        return todoList.count
    }
    
    func configureCell(_ cell: ListTableViewCellProtocol, forRowAt indexPath: IndexPath) {
        let todo = todoList[indexPath.row]
        cell.configureWith(name: todo.title ?? "", isChecked: todo.completed ? .checkmark : .none)
    }
    
    func didSelectTableViewRowAt(indexPath: IndexPath) {
        print("didSelectTableViewRowAt")
    }
}


