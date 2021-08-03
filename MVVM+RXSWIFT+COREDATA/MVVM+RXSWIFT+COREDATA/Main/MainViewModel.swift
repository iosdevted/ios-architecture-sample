//
//  MainViewModel.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import RxCocoa
import RxSwift

protocol MainViewModelType: ViewModelType {
    
    //Event
    
    var viewWillAppear: PublishSubject<Void> { get }
    var didTapRightBarButton: PublishSubject<Void> { get }
    
    //UI
    
    var editSetting: Driver<SettingViewModelType> { get }
}


struct MainViewModel: MainViewModelType {
    
    //MARk: -> Event
    
    let viewWillAppear = PublishSubject<Void>()
    let didTapRightBarButton = PublishSubject<Void>()
    
    //MARK <- UI
    
    let editSetting: Driver<SettingViewModelType>
    
    //MARK: - Initialize
    
    init() {
        
        //Navigation
        
        editSetting = didTapRightBarButton
            .map {
                return SettingViewModel()
            }
            .asDriver(onErrorJustReturn: SettingViewModel())
    }
}
