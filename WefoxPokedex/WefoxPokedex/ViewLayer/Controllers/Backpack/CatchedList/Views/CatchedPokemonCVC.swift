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

    }

    func refreshView() {
        lblTitle.text = pokemon.name

        guard let uwpImgFrontPokemon = imgFrontPokemon,
            let url = URL(string: pokemon.frontDefaultUrlStr) else { return }

        uwpImgFrontPokemon.sd_imageTransition = .fade
        uwpImgFrontPokemon.sd_setShowActivityIndicatorView(true)
        uwpImgFrontPokemon.sd_setIndicatorStyle(.gray)
        uwpImgFrontPokemon.sd_setImage(with: url,
                                       placeholderImage: nil,
                                       options:.cacheMemoryOnly)
    }
    
}
