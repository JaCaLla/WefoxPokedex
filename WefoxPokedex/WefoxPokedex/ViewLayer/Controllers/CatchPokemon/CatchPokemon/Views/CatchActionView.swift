//
//  CatchActionView.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchActionView: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var btnCatch: UIButton!
    @IBOutlet weak var btnLeave: UIButton!

    // MARK: - Callbacks
    var onCatch: ( ) -> Void = { /* Default empty block */}
    var onLeave: ( ) -> Void = { /* Default empty block */}


    // MARK: - Private attributes
    var wasCatched:Bool = true

    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    // MARK: - Public helpers
    func set(existInTheBackpack:Bool) {
        self.wasCatched = existInTheBackpack
        self.refreshView()
    }

    // MARK: - Internal/Private
    func setupView() {

        self.backgroundColor = AppColors.PersonDetail.background

        btnCatch.isHidden = true
        btnCatch.titleLabel?.font        = AppFonts.PersonDetail.buttonFont
        btnCatch.titleLabel?.textColor   = AppColors.PersonDetail.fontColor
        btnCatch.backgroundColor         = AppColors.PersonDetail.buttonBackgroundColor
        btnCatch.setTitle(R.string.localizable.catch_pokemon_button_catch.key.localized, for: .normal)
        btnCatch.layer.cornerRadius = 5.0
        btnCatch.addTarget(self, action: #selector(onActionButtonCatch), for: .touchUpInside)

        btnLeave.titleLabel?.font        = AppFonts.PersonDetail.buttonFont
        btnLeave.titleLabel?.textColor   = AppColors.PersonDetail.fontColor
        btnLeave.backgroundColor         = AppColors.PersonDetail.buttonBackgroundColor
        btnLeave.setTitle(R.string.localizable.catch_pokemon_button_leave.key.localized, for: .normal)
        btnLeave.layer.cornerRadius = 5.0
        btnLeave.addTarget(self, action: #selector(onActionButtonLeave), for: .touchUpInside)
    }

    private func  refreshView() {
        self.btnCatch.isHidden = wasCatched

    }

    // MARK: - Target methods
    @objc func onActionButtonCatch(sender: UIButton!) {
        self.onCatch()
    }

    @objc func onActionButtonLeave(sender: UIButton!) {
        self.onLeave()
    }



}
