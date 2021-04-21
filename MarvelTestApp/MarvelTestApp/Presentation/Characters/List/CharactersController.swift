//
//  CharactersController.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import UIKit
import Swinject

protocol CharacterLogic: class {
    func showCharacters(characters: [Character])
    func showError(error: Error)
}

protocol CharacterControllerDelegate {
    func goToDetail(characterId: Int)
}

class CharacterController: BaseController, CharacterLogic {
    private var presenter: CharacterPresentationLogic
    
    init(presenter: CharacterPresentationLogic) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.viewController = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = CharactersView(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        presenter.getCharacters()
    }
    func showCharacters(characters: [Character]) {
        hideLoading()
        let characterView = view as? CharactersView
        characterView?.setDataCharacters(characters: characters)
    }
    func showError(error: Error) {
        hideLoading()
        showAlertError(error: error)
    }
}

extension CharacterController: CharacterControllerDelegate {
    func goToDetail(characterId: Int) {
        if let presenter = Container.defaultContainer().resolve(CharacterDetailPresentationLogic.self) {
            let detail = CharacterDetailViewController(characterId: characterId, presenter: presenter)
            detail.modalPresentationStyle = .fullScreen
            self.show(detail, sender: nil)
        }
    }
}
