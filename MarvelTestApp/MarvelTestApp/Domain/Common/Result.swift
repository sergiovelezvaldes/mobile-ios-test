//
//  Model.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 13/04/21.
//

import Foundation

struct CoreError: Error {
    var localizedDescription: String {
        return message
    }
    
    var message = ""
}

public typealias Result<T> = Swift.Result<T, Error>
