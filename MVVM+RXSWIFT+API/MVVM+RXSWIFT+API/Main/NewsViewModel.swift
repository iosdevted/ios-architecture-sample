//
//  MainViewModel.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import RxCocoa
import RxDataSources
import RxSwift

typealias ArticleData = SectionModel<String, Article>

protocol NewsViewModelType: ViewModelType {
    // Event
    var viewWillAppear: PublishSubject<Void> { get }
    var didTapLeftBarButton: PublishSubject<Void> { get }
    var didTapRightBarButton: PublishSubject<Void> { get }
    var didPulltoRefresh: PublishSubject<Void> { get }
    var didCellSelected: PublishSubject<Article> { get }
    
    // UI
    
}

struct NewsViewModel: NewsViewModelType {
    
    //MARK: - Event
    
    let viewWillAppear = PublishSubject<Void>()
    let didTapLeftBarButton = PublishSubject<Void>()
    let didTapRightBarButton = PublishSubject<Void>()
    let didPulltoRefresh = PublishSubject<Void>()
    let didCellSelected = PublishSubject<Article>()
    
    //MARK: - Initialize
    
    
//    init() {
//
//    }
    
    
}
