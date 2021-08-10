//
//  NetworkService.swift
//  MVP+API
//
//  Created by Ted on 2021/08/10.
//

import Foundation

enum ServiceError: Error {
    case urlTransformFailed
    case requestFailed(response: URLResponse, data: Data?)
    case decodeFailed
}

class NetworkService {
    
    func fetchArticles(completion: @escaping (Result<[ArticleContent], Error>) -> Void) {
        let baseUrl = "https://newsapi.org/v2/top-headlines?country=us&sortBy=%20popularity&apiKey=33e4f0e56b324ab7a51f2d8e9fef4204"
        
        guard let url = URL(string: baseUrl) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else { completion(.failure(ServiceError.urlTransformFailed))
                return
            }
            
            guard 200..<400 ~= response.statusCode else { completion(.failure(ServiceError.requestFailed(response: response, data: data)))
                return
            }
            
            do {
                let articles = try JSONDecoder().decode(Article.self, from: data)
                completion(.success(articles.articles))
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
    
}
