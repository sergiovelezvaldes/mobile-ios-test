//
//  CharacterImage.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation

struct CharacterImage: Decodable {
    let path: String?
    let ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

extension CharacterImage {
    var url: URL? {
        if let path = path, let ext = ext {
            return URL(string: "\(path).\(ext)")
        } else {
            return nil
        }
    }
}
