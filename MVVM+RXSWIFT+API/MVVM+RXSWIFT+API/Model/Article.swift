//
//  Article.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import Foundation

struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let publishedAt: String
    let url: String
}
