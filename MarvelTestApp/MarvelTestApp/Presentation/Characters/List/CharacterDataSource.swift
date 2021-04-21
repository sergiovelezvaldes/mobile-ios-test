//
//  CharacterDataSource.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import UIKit

class CharacterDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var data = [Character]()
    private var delegate: CharacterViewDelegate
    
    init(delegate: CharacterViewDelegate) {
        self.delegate = delegate
    }
    
    public func setData(_ characters: [Character]){
        data = characters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = data[indexPath.row]
        return CharacterCell(character: item)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = data[indexPath.row]
        delegate.goToDetail(characterId: item.id)
        
    }
    
}

