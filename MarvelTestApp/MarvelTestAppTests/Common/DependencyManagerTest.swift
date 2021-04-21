//
//  DependencyManager.swift
//  MarvelTestAppTests
//
//  Created by Sergio Ivan Vélez Valdés on 15/04/21.
//

import Foundation
import Swinject
import MarvelTestApp

class DependencyManagerTest {
    
    init() {
        _ = Container.defaultContainer() { container in
            container.register(CharacterGateway.self) { _ in CharactersRepositoryMocks() } .inObjectScope(.container)
        }
    }
}
