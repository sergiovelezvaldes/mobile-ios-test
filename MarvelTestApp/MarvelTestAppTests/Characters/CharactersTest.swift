//
//  CharactersTest.swift
//  CharactersTest
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//
import XCTest

import Swinject

@testable import MarvelTestApp

class CharactersTest: XCTestCase {
    let dependencyManager: DependencyManagerTest = DependencyManagerTest()
    private var getCharactersUseCase: GetCharactersUseCase?
    private var getCharacterDetailUseCase: GetCharacterDetailUseCase?
    
    override func setUp() {
        super.setUp()
        let gateway = Container.defaultContainer().resolve(CharacterGateway.self)!
        getCharactersUseCase = GetCharactersUseCaseUseCaseImplementation(characterGateway: gateway)
        getCharacterDetailUseCase = GetCharacterDetailUseCaseImplementation(characterGateway: gateway)
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
        getCharactersUseCase = nil
    }

    
    func testGetCharacters() {
        //Given
        guard let useCase = getCharactersUseCase else{
            return
        }
        //When
        do {
            useCase.getCharacters{
                (result) in
                switch result {
                case .success(let characters):
                    //Then
                    XCTAssertEqual(characters.count, 2)
                case .failure( _):
                    XCTFail()
                }
            }
        }
    }
    
    func testGetCharactersById() {
        //Given
        guard let useCase = getCharacterDetailUseCase else{
            return
        }
        let id = 5
        let namedExpected = "X-men"
        //When
        do {
            useCase.getCharacterById(characterId: id, completionHandler: {(result) in
                switch result {
                case .success(let character):
                    //Then
                    XCTAssertEqual(character.name, namedExpected)
                case .failure( _):
                    XCTFail()
                }
            })
        }
    }
    
    func testGetCharactersByIdWrong() {
        //Given
        guard let useCase = getCharacterDetailUseCase else{
            return
        }
        let id = 3
        //When
        do {
            useCase.getCharacterById(characterId: id, completionHandler: {(result) in
                switch result {
                case .success( _):
                    //Then
                    XCTFail()
                case .failure(let error):
                    let coreError = error as! CoreError
                    XCTAssertEqual(coreError.localizedDescription, "Doesn´t exist the character requested")
                }
            })
        }
    }
    
}


