//
//  MainViewModel.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import RxCocoa
import RxDataSources
import RxSwift

typealias ArticleData = SectionModel<String, ArticleContent>

protocol NewsViewModelType: ViewModelType {
    
    // Event
    
    var viewWillAppear: PublishSubject<Void> { get }
    var didTapLeftBarButton: PublishSubject<Void> { get }
    var didPulltoRefresh: PublishSubject<Void> { get }
    var didCellSelected: PublishSubject<ArticleContent> { get }
    
    // UI
    
    var isNetworking: Driver<Bool> { get }
    var showAlert: Driver<(String, String)> { get }
    var articles: Driver<[ArticleData]> { get }
    var showArticle: Driver<String> { get }
}

struct NewsViewModel: NewsViewModelType {
    
    //MARK: -> Event
    
    let viewWillAppear = PublishSubject<Void>()
    let didTapLeftBarButton = PublishSubject<Void>()
    let didTapRightBarButton = PublishSubject<Void>()
    let didPulltoRefresh = PublishSubject<Void>()
    let didCellSelected = PublishSubject<ArticleContent>()
    
    //MARK: <- UI
    
    let isNetworking: Driver<Bool>
    let showAlert: Driver<(String, String)>
    let articles: Driver<[ArticleData]>
    let showArticle: Driver<String>
    
    //MARK: - Initialize
    
    init(apiService: APIServiceType = APIService()) {
        let onNetworking = PublishSubject<Bool>()
        let onError = PublishSubject<Error>()
        
        isNetworking = onNetworking.asDriver(onErrorJustReturn: false)
        
        showAlert = onError
            .map { error -> (String, String) in
                return ("Error", error.localizedDescription)
            }.asDriver(onErrorJustReturn: ("Error", "Unknown Error"))
        
        // API Data
        
        articles = Observable<Void>
            .merge([viewWillAppear, didTapLeftBarButton, didPulltoRefresh])
            .observe(on: ConcurrentDispatchQueueScheduler(qos: .default))
            .do(onNext: { _ in onNetworking.onNext(true)})
            .flatMap {
                return apiService.fetchData()
                    .retry(2)
                    .do(onDispose:  { onNetworking.onNext(false) })
                    .catch({ error -> Single<[ArticleContent]> in
                        onError.onNext(error)
                        return .never()
                    })
            }
            .map { [ArticleData(model: "", items: $0)] }
            .asDriver(onErrorJustReturn: [])
        
        // Navigation
        
        showArticle = didCellSelected
            .map { $0.url }
            .asDriver(onErrorJustReturn: "")
    }
}
