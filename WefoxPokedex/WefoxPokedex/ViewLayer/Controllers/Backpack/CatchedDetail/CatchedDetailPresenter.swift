//
//  CatchedDetailPresenter.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchedDetailPresenter: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var catchedDetailView: CatchedDetailView!


    // MARK: - Privvate attributes
    private var injectedCatchedDetailModelView:CatchedDetailViewModel = CatchedDetailViewModel(pokemon: Pokemon())

    // MARK: - Constructor/Initializer
    static func instantiate(catchedDetailModelView:CatchedDetailViewModel = CatchedDetailViewModel(pokemon: Pokemon())) -> CatchedDetailPresenter {
        let catchedDetailPresenter = CatchedDetailPresenter.instantiate(fromAppStoryboard: .backpack)
        catchedDetailPresenter.injectedCatchedDetailModelView = catchedDetailModelView
        return catchedDetailPresenter
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }


    // MARK: - Private - Internal
    private func setupPresenter() {

        injectedCatchedDetailModelView.onStateChanged = { [weak self] newViewModelState in
            guard let weakSelf = self else { return }
            weakSelf.refreshView(catchedDetailViewModelState: newViewModelState)
        }
        injectedCatchedDetailModelView.start()

        //activityIndicator.style = .whiteLarge
    }


    private func refreshView(catchedDetailViewModelState:CatchedDetailViewModelState) {
        switch catchedDetailViewModelState {
        case .checkingCatched(let pokemon): refreshCheckingCatched(pokemon: pokemon)
        }
    }

    func refreshCheckingCatched(pokemon: Pokemon) {
        self.catchedDetailView.set(pokemon: pokemon)
       // self.injectedCatchPokemonViewModel.exists(pokemon: pokemon)
    }

}
