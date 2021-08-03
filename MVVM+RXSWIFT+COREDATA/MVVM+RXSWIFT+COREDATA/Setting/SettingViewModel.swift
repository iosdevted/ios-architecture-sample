//
//  SettingViewModel.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import RxCocoa
import RxSwift

protocol SettingViewModelType: ViewModelType {
    
    // Event
    
    var didSwitchValueChanged: PublishSubject<Void> { get }
    
}

struct SettingViewModel: SettingViewModelType {
    
    //MARK: -> Event
    
    let didSwitchValueChanged = PublishSubject<Void>()
    
    
}
