//
//  Article.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import Foundation

struct Article: Decodable {
    let articles: [ArticleContent]
}

struct ArticleContent: Decodable {
    let title: String
    let publishedAt: String
    let url: String
}
