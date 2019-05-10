//
//  AttributePokemonTVC.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class AttributePokemonTVC: UITableViewCell {

    //MARK: - IBOutlet
    @IBOutlet weak var lblAttributeName: UILabel!
    @IBOutlet weak var lblAttributeValue: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    // MARK: - Public helpets
    func set(name:String, value: String) {

        lblAttributeName.text = name
        lblAttributeValue.text = value
    }

    func setupView() {

        lblAttributeName.font = AppFonts.CatchPokemon.nameFont
        lblAttributeName.textColor = AppColors.CatchPokemon.nameFontColor

        lblAttributeValue.font = AppFonts.CatchPokemon.valueFont
        lblAttributeValue.textColor = AppColors.CatchPokemon.valueFontColor
        
        self.backgroundColor = AppColors.CatchPokemon.background
    }

}
