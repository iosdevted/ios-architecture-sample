//
//  UIView+Extensions.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
