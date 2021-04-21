//
//  CharacterGateway.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import Combine

public typealias FetchCharactersGatewayCompletionHandler = (_ characters: Result<[Character]>) -> Void
public typealias FetchCharacterByIdGatewayCompletionHandler = (_ characters: Result<Character>) -> Void

public protocol CharacterGateway {

    func getCharacters(completionHandler: @escaping FetchCharactersGatewayCompletionHandler)
    func getCharacterById(id: Int, completionHandler: @escaping FetchCharacterByIdGatewayCompletionHandler)
}
