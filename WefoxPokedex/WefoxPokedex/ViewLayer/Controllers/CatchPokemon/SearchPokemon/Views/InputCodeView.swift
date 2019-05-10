//
//  InputCodeView.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class InputCodeView: UIView {

    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var btnSearch: UIButton!

    // MARK: - Callbacks
    var onCodeEntered: (String) -> Void = { _ in /* Default empty block */}

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }



    // MARK: - Private/Internal
    func setupView() {

        self.backgroundColor = AppColors.SearchPokemon.background

        lblTitle.font = AppFonts.PersonsList.emailFont
        lblTitle.textColor = AppColors.SearchPokemon.titleFontColor
        lblTitle.text = R.string.localizable.search_pokemon_title.key.localized

        txtCode.font = AppFonts.PersonsList.emailFont
        txtCode.textColor = AppColors.SearchPokemon.textInputColor
        txtCode.keyboardType = .numberPad

        btnSearch.titleLabel?.font        = AppFonts.PersonDetail.buttonFont
        btnSearch.titleLabel?.textColor   = AppColors.PersonDetail.fontColor
        btnSearch.backgroundColor         = AppColors.PersonDetail.buttonBackgroundColor
        btnSearch.setTitle(R.string.localizable.search_pokemon_button_title.key.localized, for: .normal)
        btnSearch.layer.cornerRadius = 5.0

        btnSearch.addTarget(self, action: #selector(onActionButton), for: .touchUpInside)
    }

    // MARK: - Target methods
    @objc func onActionButton(sender: UIButton!) {
        guard let text = txtCode.text,
            text.count > 0 else { return }
        txtCode.text = ""
        txtCode.endEditing(true)
        onCodeEntered(text)
    }

}