//
//  ApiCharacter.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation

struct ApiCharacter: Decodable {
    
    var id: Int
    var name: String
    var description: String
    var thumbnail: CharacterImage
}

extension ApiCharacter {
    var character: Character {
        return Character(id: id,
                         name: name,
                         description: description,
                         thumbnail: thumbnail)
        
    }
}
