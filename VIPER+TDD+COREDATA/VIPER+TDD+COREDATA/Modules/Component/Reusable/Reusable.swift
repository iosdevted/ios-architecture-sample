//
//  Reusable.swift
//  VIPER+TDD+COREDATA
//
//  Created by Ted on 2021/07/29.
//

protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
