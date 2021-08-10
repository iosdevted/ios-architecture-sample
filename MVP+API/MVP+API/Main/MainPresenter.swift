//
//  MainPresenter.swift
//  MVP+API
//
//  Created by Ted on 2021/08/10.
//

import Foundation

protocol MainPresenterType {
    var view: MainViewType? { get set }
    
    func setView(view: MainViewType?)
    func onViewDidLoad() 
    func fetchData()
    func numberOfRowsInSection(in section: Int) -> Int
    func configureCell(cell: MainTableViewCell, indexPath: IndexPath)
}

final class MainPresenter: MainPresenterType {
    
    //MARK: - Properties
    
    weak var view: MainViewType?
    private let networkService = NetworkService()
    private var articles = [ArticleContent]()
    
    //MARK: MainViewPresenterType
    
    func setView(view: MainViewType?){
        self.view = view
    }
    
    func onViewDidLoad() {
        fetchData()
    }
    
    func fetchData() {
        view?.startNetworking()
        networkService.fetchArticles { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    self?.view?.presentAlert(title: "Error", message: error.localizedDescription)
                }
                self?.view?.stopNetworking()
            }
        }
    }
    func numberOfRowsInSection(in section: Int) -> Int {
        return articles.count
    }
    
    func configureCell(cell: MainTableViewCell, indexPath: IndexPath) {
        let article = articles[indexPath.row]
        cell.configureWith(title: article.title, date: article.date)
    }
}
