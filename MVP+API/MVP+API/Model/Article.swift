//
//  Article.swift
//  MVP+API
//
//  Created by Ted on 2021/08/10.
//

import Foundation

struct Article: Decodable {
    let articles: [ArticleContent]
}

struct ArticleContent {
    let title: String
    let date: String
    let source: ArticleSource
}

extension ArticleContent: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case date = "publishedAt"
        case source
    }
}

struct ArticleSource: Decodable {
    let name: String
}


