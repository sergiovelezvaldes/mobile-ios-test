//
//  CharactersRepositoryMocks.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation


open class CharactersRepositoryMocks: CharacterGateway {
    private var characterMock: Character
    
    public init() {
    characterMock = Character(id: 5,
                              name: "X-men",
                              description: "This is a strongest character in the universe marvel",
                              thumbnail: CharacterImage(path: "", ext: ""))
    }
    public func getCharacterById(id: Int, completionHandler:@escaping (Result<Character>) -> Void) {
        if id == 5 {
            completionHandler(.success(characterMock))
        } else {
            completionHandler(.failure(CoreError(message: "Doesn´t exist the character requested")))
        }
    }
    public func getCharacters(completionHandler:  @escaping (Result<[Character]>) -> Void) {
        completionHandler(.success([characterMock, characterMock]))
    }
}
