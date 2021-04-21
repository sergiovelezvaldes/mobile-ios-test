//
//  CharacterDetailView.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 14/04/21.
//

import Foundation
import UIKit

class CharacterDetailView: UIView {
    required init() {
        super.init(frame: CGRect.zero)
        setupViews()
        setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCharacter(character: Character) {
        descriptionCharacter.text = character.description
        nameCharacter.text = character.name
        if let url = character.thumbnail.url {
            characterImage.loadImage(from: url)
            characterImage.layer.cornerRadius = 50
            characterImage.clipsToBounds = true
        }
    }
    private func setupViews() {
        backgroundColor = UIColor.white
        addSubViewsAndActiveAutoLayout([mainStackView])
        cardViewContainer.addSubViewsAndActiveAutoLayout([stackViewlabels])
    }
    private func setupConstrainst() {
        let margins = layoutMarginsGuide
        mainStackView.fullConstraintViewSafeArea(margins, Dimensions.Margin.large)
        stackViewlabels.fullconstraintView(cardViewContainer, Dimensions.Margin.medium)
    }
    lazy var cardViewContainer: CardView = {
        let cardView = CardView()
        cardView.cornerRadius = 5
        return cardView
    }()
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [characterImage, cardViewContainer])
        stack.axis = .vertical
        stack.spacing = Dimensions.Margin.small
        stack.distribution = .fillEqually
        return stack
    }()
    lazy var stackViewlabels: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameCharacter, descriptionCharacter])
        stack.axis = .vertical
        stack.spacing = Dimensions.Margin.small
        stack.distribution = .fillProportionally
        return stack
    }()
    lazy var characterImage: ImageLoader = {
        let image = ImageLoader()
        return image
    }()
    lazy var nameCharacter: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    lazy var descriptionCharacter: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
}
