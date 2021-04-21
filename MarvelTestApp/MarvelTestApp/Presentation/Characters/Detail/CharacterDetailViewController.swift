//
//  CharacterDetailViewController.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation
import UIKit

protocol CharacterDetailLogic: class {
    func showDetailCharacter(character: Character)
    func showError(error: Error)
}

class CharacterDetailViewController: BaseController, CharacterDetailLogic {
    
    private var characterId: Int
    private var presenter: CharacterDetailPresentationLogic
    
    init(characterId: Int, presenter: CharacterDetailPresentationLogic) {
        self.presenter = presenter
        self.characterId = characterId
        super.init(nibName: nil, bundle: nil)
        self.presenter.viewController = self
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showLoading()
        presenter.getCharacterById(id: characterId)
    }
    func showDetailCharacter(character: Character) {
        hideLoading()
        let detailView = view as? CharacterDetailView
        detailView?.setCharacter(character: character)
    }
    func showError(error: Error) {
        hideLoading()
        showAlertError(error: error)
    }
}
