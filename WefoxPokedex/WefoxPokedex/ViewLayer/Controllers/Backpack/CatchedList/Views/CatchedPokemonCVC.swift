//
//  CatchedPokemonCVC.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchedPokemonCVC: UICollectionViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgFrontPokemon: UIImageView!
    @IBOutlet weak var svwRecipe: UIView!

    // MARK: - Private attributes
    private var pokemon:Pokemon = Pokemon()

    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupView()
    }

    // MARK: - Public helpers
    func set(pokemon:Pokemon) {
        self.pokemon = pokemon
        refreshView()
    }


    // MARK: - Private/Internal
    func setupView() {
        self.svwRecipe.dropShadow()
        self.svwRecipe.backgroundColor = AppColors.CatchedDetail.cellBackground
        self.svwRecipe.layer.cornerRadius = 10.0
        self.svwRecipe.layer.borderWidth = 1.0

        lblTitle.font = AppFonts.CatchedList.nameFont
        lblTitle.textColor = AppColors.CatchedList.nameFontColor
        lblTitle.textAlignment = .center

        imgFrontPokemon.contentMode = .scaleAspectFit
    }

    func refreshView() {
        lblTitle.text = pokemon.name

        guard  let url = URL(string: pokemon.frontDefaultUrlStr) else { return }

        imgFrontPokemon.sd_imageTransition = .fade
        imgFrontPokemon.sd_setShowActivityIndicatorView(true)
        imgFrontPokemon.sd_setIndicatorStyle(.gray)
        imgFrontPokemon.sd_setImage(with: url,
                                       placeholderImage: nil,
                                       options:.cacheMemoryOnly)
    }
    
}
