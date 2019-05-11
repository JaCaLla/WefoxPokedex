//
//  CatchPokemonPresenterViewController.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchPokemonPresenter: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var pokemonDetailView: PokemonDetailView!
    @IBOutlet weak var catchActionView: CatchActionView!

    // MARK: - Callbacks
    var onCatchOrLeave: ( ) -> Void = { /* Default empty block */}

    // MARK: - Privvate attributes
    private var injectedCatchPokemonViewModel:CatchPokemonViewModel = CatchPokemonViewModel(pokemon: Pokemon())

    // MARK: - Constructor/Initializer
    static func instantiate(catchPokemonViewModel:CatchPokemonViewModel = CatchPokemonViewModel(pokemon: Pokemon())) -> CatchPokemonPresenter {
        let catchPokemonPresenter = CatchPokemonPresenter.instantiate(fromAppStoryboard: .catchPokemon)
        catchPokemonPresenter.injectedCatchPokemonViewModel = catchPokemonViewModel
        return catchPokemonPresenter
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        injectedCatchPokemonViewModel.start()
    }
    // MARK: - Private/Internal
    private func setupPresenter() {
        
        self.title = R.string.localizable.catch_pokemon_title.key.localized
        self.view.backgroundColor = AppColors.SearchPokemon.background

        injectedCatchPokemonViewModel.onStateChanged = { [weak self] newViewModelState in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                weakSelf.refreshView(catchPokemonViewModelState: newViewModelState)
            }
        }
        injectedCatchPokemonViewModel.start()

        catchActionView.onCatch = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.injectedCatchPokemonViewModel.addToBackpack()
        }

        catchActionView.onLeave = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.onCatchOrLeave()

        }
    }

    private func refreshView(catchPokemonViewModelState:CatchPokemonViewModelState) {
        switch catchPokemonViewModelState {
        case .checkingCatched(let pokemon): refreshCheckingCatched(pokemon: pokemon)
        case .checkedCatched(let existInTheBackpack): refreshCheckedCatched(existInTheBackpack:existInTheBackpack)
        case .addedToBackpack: self.onCatchOrLeave()
        }
    }

    func refreshCheckingCatched(pokemon: Pokemon) {
        self.pokemonDetailView.set(pokemon: pokemon)
        self.injectedCatchPokemonViewModel.exists(pokemon: pokemon)
    }

    func refreshCheckedCatched(existInTheBackpack: Bool) {
        self.catchActionView.set(existInTheBackpack: existInTheBackpack)
    }
}
