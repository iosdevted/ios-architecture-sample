//
//  ServiceResult.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import Foundation

enum ServiceError: Error {
    case unknown
    case urlTransformFailed
    case requestFailed(response: HTTPURLResponse, data: Data?)
}
