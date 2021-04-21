//
//  CharacterRequest.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation

class CharacterRequest: MarvelApiBase, ApiRequest {
    var urlRequest: URLRequest {
        
        var components = URLComponents(url: baseURL.appendingPathComponent("v1/public/characters"), resolvingAgainstBaseURL: true)
        
        components?.queryItems = getCommonQueryItems()
        
        var request = URLRequest(url: (components?.url)!)
        
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
