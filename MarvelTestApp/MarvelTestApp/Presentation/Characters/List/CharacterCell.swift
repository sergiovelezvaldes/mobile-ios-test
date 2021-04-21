//
//  CharacterCell.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 12/04/21.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {
    
    private var character: Character
    
    required init(character: Character) {
        self.character = character
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CharacterCell")
        setupViews()
        setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubViewsAndActiveAutoLayout([cardViewContainer])
        cardViewContainer.addSubViewsAndActiveAutoLayout([nameCharacter])
    }
    
    private func setupConstrainst() {
        nameCharacter.fullconstraintView(cardViewContainer, Dimensions.Margin.medium, Dimensions.Margin.medium)
        cardViewContainer.fullconstraintView(self,  Dimensions.Margin.medium, Dimensions.Margin.medium)

    }
    
    //MARK: Lazy variables
    lazy var cardViewContainer: CardView = {
        let cardView = CardView()
        cardView.cornerRadius = 5
        cardView.shadowColor = UIColor.black
        return cardView
    }()
    
    lazy var stackViewlabels: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameCharacter, descriptionCharacter])
        stack.axis = .vertical
        stack.spacing = Dimensions.Margin.small
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var nameCharacter: UILabel = {
        let label = UILabel()
        label.text = character.name
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionCharacter: UILabel = {
        let label = UILabel()
        label.text = character.description
        label.numberOfLines = 0
        return label
    }()
    
}
