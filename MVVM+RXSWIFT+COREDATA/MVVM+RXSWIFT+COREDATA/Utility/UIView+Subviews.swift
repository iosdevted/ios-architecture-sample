//
//  UIView+Subviews.swift
//  MVVM+RXSWIFT+COREDATA
//
//  Created by Ted on 2021/08/03.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
