//
//  CharacterDetailPresenter.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//
import Foundation
import Swinject


protocol CharacterDetailPresentationLogic {
    func getCharacterById(id: Int)
    var viewController: CharacterDetailLogic? { get set }
}

class CharacterDetailPresenter: CharacterDetailPresentationLogic {
    var characterGateway: CharacterGateway
    private let getCharacterDetailUseCase: GetCharacterDetailUseCase
    weak var viewController: CharacterDetailLogic?
    
    init() {
        characterGateway = Container.defaultContainer().resolve(CharacterGateway.self)!
        getCharacterDetailUseCase = GetCharacterDetailUseCaseImplementation(characterGateway: self.characterGateway)
    }
    func getCharacterById(id: Int) {
        getCharacterDetailUseCase.getCharacterById(characterId: id, completionHandler: { result in
            switch result {
            case let .success(character):
                self.handleCharactersReceived(character)
                
            case let .failure(error):
                self.handleCharactersError(error)
            }
        })
    }
    private func handleCharactersReceived(_ character: Character) {
        guard let controller = viewController else {
            return
        }
        controller.showDetailCharacter(character: character)
    }
    private func handleCharactersError(_ error: Error) {
        guard let controller = viewController else {
            return
        }
        controller.showError(error: error)
    }
}
