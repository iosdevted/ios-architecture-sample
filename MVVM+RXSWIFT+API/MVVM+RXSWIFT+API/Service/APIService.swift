//
//  APIService.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import Foundation
import RxCocoa
import RxSwift

protocol APIServiceType {
    func fetchData() -> Single<[ArticleContent]>
}

struct APIService: APIServiceType {
    
    //MARK: - Properties
    
    private let session: URLSession
    
    //MARK: - Initialize
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    // MARK: - DataTask
    
    func fetchData() -> Single<[ArticleContent]> {
        let baseUrl = "https://newsapi.org/v2/top-headlines?country=us&sortBy=%20popularity&apiKey=33e4f0e56b324ab7a51f2d8e9fef4204"
        
        guard let url = URL(string: baseUrl) else { return .error(ServiceError.urlTransformFailed) }
        
        return session.rx.dataTask(request: URLRequest(url: url))
            .map { data throws in
                let articles = try data.decode(Article.self)
                return articles.articles
                
            }
        
    }
    
    
}
