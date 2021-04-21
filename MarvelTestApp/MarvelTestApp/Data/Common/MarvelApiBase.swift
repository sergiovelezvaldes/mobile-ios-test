//
//  MarvelApiBase.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 15/04/21.
//

import Foundation

class MarvelApiBase {
    
    let baseURL: URL = URL(string: "https://gateway.marvel.com:443")!
    let privateKey: String = "76cb8d0bd88b49abe3e4d049e6064518062f998c"
    let apiKey: String = "875845bd62b336d8a07e26ac5667a4f8"
    let timestamp = "1"
    let hash = "b6294d69dc4bccc920feb814037b904e"
    
    
    func getCommonQueryItems() -> [URLQueryItem]{
        let commonQueryItems = [
            URLQueryItem(name: "ts", value: self.timestamp),
            URLQueryItem(name: "hash", value: hash),
            URLQueryItem(name: "apikey", value: apiKey)
        ]
        return commonQueryItems
    }
}
