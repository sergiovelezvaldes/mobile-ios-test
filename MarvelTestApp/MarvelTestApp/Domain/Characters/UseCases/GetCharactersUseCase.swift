//
//  GetCharactersUseCase.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation

typealias GetCharactersUseCaseCompletionHandler = (_ characters: Result<[Character]>) -> Void

protocol GetCharactersUseCase {
    func getCharacters(completionHandler: @escaping GetCharactersUseCaseCompletionHandler)
}

class GetCharactersUseCaseUseCaseImplementation: GetCharactersUseCase {

    let characterGateway: CharacterGateway
    
    init(characterGateway: CharacterGateway) {
        self.characterGateway = characterGateway
    }

    func getCharacters(completionHandler: @escaping (_ characters: Result<[Character]>) -> Void) {
        characterGateway.getCharacters{ (result) in
            completionHandler(result)
        }
    }
}
