//
//  CharacterRequestById.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation

class CharacterRequestById: MarvelApiBase, ApiRequest {
    let characterId: Int
    
    internal init(characterId: Int) {
        self.characterId = characterId
    }
    
    var urlRequest: URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent("v1/public/characters/\(characterId)"), resolvingAgainstBaseURL: true)
        
        components?.queryItems = getCommonQueryItems()
        
        var request = URLRequest(url: (components?.url)!)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
