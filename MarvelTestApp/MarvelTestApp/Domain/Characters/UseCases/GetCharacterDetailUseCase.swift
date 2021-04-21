//
//  GetCharacterDetailUseCase.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation

typealias GetCharacterByIdGatewayCompletionHandler = (_ characters: Result<Character>) -> Void

protocol GetCharacterDetailUseCase {
    func getCharacterById(characterId: Int, completionHandler: @escaping GetCharacterByIdGatewayCompletionHandler)
}

class GetCharacterDetailUseCaseImplementation: GetCharacterDetailUseCase {

    let characterGateway: CharacterGateway
    
    init(characterGateway: CharacterGateway) {
        self.characterGateway = characterGateway
    }

    func getCharacterById(characterId: Int, completionHandler: @escaping (_ characters: Result<Character>) -> Void) {
        characterGateway.getCharacterById(id: characterId, completionHandler: { (result) in
            completionHandler(result)
        })
    }
}
