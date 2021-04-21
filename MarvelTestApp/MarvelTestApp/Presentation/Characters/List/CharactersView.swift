//
//  CharactersView.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import UIKit

protocol CharacterViewDelegate {
    func goToDetail(characterId: Int)
}

class CharactersView: UIView, CharacterViewDelegate {
    
    private var dataSource: CharacterDataSource?
    private var delegate: CharacterControllerDelegate
    
    lazy var charactersTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsMultipleSelection = false
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        return tableView
    }()
    
    lazy var mainImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"ic_main")
        image.setSizeImage(width: 200, height: 100)
        return image
    }()
    
    
    required init(_ delegate: CharacterControllerDelegate) {
        self.delegate = delegate
        super.init(frame: CGRect.zero)
        backgroundColor = UIColor.white
        dataSource = CharacterDataSource(delegate: self)
        setupViews()
        setupConstrainst()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        
        addSubViewsAndActiveAutoLayout([mainImage,charactersTableView])
        
    }
    
    private func setupConstrainst() {
        let margins = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
            mainImage.topAnchor.constraint(equalTo: margins.topAnchor, constant: Dimensions.Margin.small),
        ])
        NSLayoutConstraint.activate([
            charactersTableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: Dimensions.Margin.small ),
            charactersTableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0 - Dimensions.Margin.small ),
            charactersTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: Dimensions.Margin.small ),
            charactersTableView.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 0 -  Dimensions.Margin.small )
        ])
    }
    
    func setDataCharacters(characters: [Character]) {
        guard let dataSource = self.dataSource else {
            return
        }
        dataSource.setData(characters)
        charactersTableView.reloadData()
    }
    
    func goToDetail(characterId: Int) {
        delegate.goToDetail(characterId: characterId)
    }
    
}
