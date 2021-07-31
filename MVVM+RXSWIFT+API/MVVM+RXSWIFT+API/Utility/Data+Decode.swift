//
//  Data+Decode.swift
//  MVVM+RXSWIFT+API
//
//  Created by Ted on 2021/07/31.
//

import Foundation

extension Data {
    func decode<T>(_ type: T.Type, decoder: JSONDecoder? = nil) throws -> T where T: Decodable {
        let decoder = decoder ?? JSONDecoder()
        return try decoder.decode(type, from: self)
    }
}
