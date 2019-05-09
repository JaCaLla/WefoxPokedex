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
        // Initialization code
    }

    // MARK: - Public helpets
    func set(imageUrlStr:String) {
        guard let uwpImgFrontPokemon = imgFrontPokemon,
            let url = URL(string: imageUrlStr) else { return }

        uwpImgFrontPokemon.sd_imageTransition = .fade
        uwpImgFrontPokemon.sd_setShowActivityIndicatorView(true)
        uwpImgFrontPokemon.sd_setIndicatorStyle(.gray)
        uwpImgFrontPokemon.sd_setImage(with: url,
                                       placeholderImage: nil,
                                       options:.cacheMemoryOnly)
    }

}
