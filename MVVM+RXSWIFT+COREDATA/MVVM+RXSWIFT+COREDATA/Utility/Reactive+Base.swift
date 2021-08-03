//
//  Reactive+Base.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit
import RxCocoa
import RxSwift

extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let source = methodInvoked(#selector(Base.viewWillAppear))
            .map { _ in }
        return ControlEvent(events: source)
    }
}
