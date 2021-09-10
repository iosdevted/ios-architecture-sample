//
//  NewsViewModel.swift
//  MVVM+API
//
//  Created by Ted on 2021/09/10.
//

import Foundation

protocol NewsViewModelType: ViewModelType {
    
    var didTapLeftBarButton: Box<Bool> { get set }
    var didTapRightBarButton: Box<Bool> { get set }
    var didPulltoRefresh: Box<Bool> { get set }
}

class NewsViewModel: NewsViewModelType {
    
    var didTapLeftBarButton = Box(false)
    var didTapRightBarButton = Box(false)
    var didPulltoRefresh = Box(false)
    
}
