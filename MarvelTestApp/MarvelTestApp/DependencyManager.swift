//
//  DependencyManager.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import Swinject

class DependencyManager {
    init() {
        _ = Container.defaultContainer() { container in
            container.register(CharacterGateway.self) { _ in CharactersRepository() } .inObjectScope(.container)
            container.register(CharacterPresentationLogic.self) { _ in CharacterPresenter() } .inObjectScope(.container)
            container.register(CharacterDetailPresentationLogic.self) { _ in CharacterDetailPresenter() } .inObjectScope(.container)
        }
    }
}
