//
//  UIView+Subviews.swift
//  MVVM+API
//
//  Created by Ted on 2021/09/10.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
