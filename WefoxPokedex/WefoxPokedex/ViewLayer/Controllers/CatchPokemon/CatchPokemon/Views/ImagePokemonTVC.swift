//
//  AttributePokemonTVC.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit
import SDWebImage

class ImagePokemonTVC: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet weak var imgFrontPokemon: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }


    // MARK: - Public helpets
    func set(imageUrlStr:String) {
        guard let url = URL(string: imageUrlStr) else { return }

        imgFrontPokemon.sd_imageTransition = .fade
        imgFrontPokemon.sd_setShowActivityIndicatorView(true)
        imgFrontPokemon.sd_setIndicatorStyle(.gray)
        imgFrontPokemon.sd_setImage(with: url,
                                       placeholderImage: nil,
                                       options:.cacheMemoryOnly)
    }

    func setupView() {
        self.backgroundColor = AppColors.CatchPokemon.background
        imgFrontPokemon.contentMode = .scaleAspectFit
    }

}
