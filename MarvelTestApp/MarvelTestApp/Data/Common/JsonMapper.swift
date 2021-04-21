//
//  JsonMapper.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation

public extension Dictionary where Key: ExpressibleByStringLiteral, Value: Any  {

    func toJsonData() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            return Data()
        }
    }
}

public extension Array where Element: Any {
    func toJsonData() -> Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: [])
        } catch {
            return Data()
        }
    }
}
