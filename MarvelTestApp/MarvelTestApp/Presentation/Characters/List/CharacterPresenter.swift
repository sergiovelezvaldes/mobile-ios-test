//
//  CharacterPresenter.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import Swinject


protocol CharacterPresentationLogic {
    func getCharacters()
    var viewController: CharacterLogic? { get set }
}

class CharacterPresenter: CharacterPresentationLogic {
    
    weak var viewController: CharacterLogic?
    
    var characterGateway : CharacterGateway
    
    private let getCharactersUseCase: GetCharactersUseCase

    init() {
        characterGateway = Container.defaultContainer().resolve(CharacterGateway.self)!
        getCharactersUseCase = GetCharactersUseCaseUseCaseImplementation(characterGateway: self.characterGateway)
    }
    
    func getCharacters() {
        self.getCharactersUseCase.getCharacters { (result) in
            switch result {
            case let .success(characters):
                self.handleCharactersReceived(characters)
            case let .failure(error):
                self.handleCharactersError(error)
            }
        }
    }
    
    private func handleCharactersReceived(_ characters: [Character]){
        guard let controller = viewController else {
            return
        }
        controller.showCharacters(characters: characters)
    }
    
    private func handleCharactersError(_ error: Error){
        guard let controller = viewController else {
            return
        }
        controller.showError(error: error)
    }
}
