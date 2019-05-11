//
//  SearchPokemonPresenter.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class SearchPokemonPresenter: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var inputCodeView: InputCodeView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    // MARK: - Callbacks
    var onFound: (Pokemon) -> Void = { _ in /* Default empty block */}

    // MARK: - Privvate attributes
    private var injectedSearchPokemonViewModel:SearchPokemonViewModel = SearchPokemonViewModel()

    // MARK: - Constructor/Initializer
    static func instantiate(searchPokemonViewModel:SearchPokemonViewModel = SearchPokemonViewModel()) -> SearchPokemonPresenter {
        let searchPokemonPresenter = SearchPokemonPresenter.instantiate(fromAppStoryboard: .catchPokemon)
        searchPokemonPresenter.injectedSearchPokemonViewModel = searchPokemonViewModel
        return searchPokemonPresenter
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        injectedSearchPokemonViewModel.start()
    }
    // MARK: - Private/Internal
    private func setupPresenter() {

        self.title = R.string.localizable.tab_catched.key.localized
        self.view.backgroundColor = AppColors.CatchPokemon.background

        injectedSearchPokemonViewModel.onStateChanged = { [weak self] newViewModelState in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                weakSelf.refreshView(searchPokemonViewModelState: newViewModelState)
            }
        }
        injectedSearchPokemonViewModel.start()

        inputCodeView.onCodeEntered = { [weak self] in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                weakSelf.injectedSearchPokemonViewModel.getPokemon()
            }
        }
        activityIndicator.style = .gray
    }

    private func refreshView(searchPokemonViewModelState:SearchPokemonViewModelState) {
        switch searchPokemonViewModelState {
        case .idle:                 refreshViewIdle()
        case .fetching:             refreshViewFetching()
        case .fetched(let pokemon): refreshViewFetched(pokemon: pokemon)
        case .fetchedNotFound:      refreshViewFetchedNotFound()
        case .fetchedFailed:        refreshViewFetchedFailed()
        }
    }

    func refreshViewIdle() {
        inputCodeView.isHidden = false
        activityIndicator.isHidden = true
    }

    func refreshViewFetching() {
        inputCodeView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }

    func refreshViewFetched(pokemon:Pokemon) {
        inputCodeView.isHidden = true
        activityIndicator.isHidden = true
        self.onFound(pokemon)
    }

    func refreshViewFetchedNotFound() {
        inputCodeView.isHidden = false
        activityIndicator.isHidden = true
        self.presentAlertPokemonNotFound(onComplete: { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.injectedSearchPokemonViewModel.start()
        })
    }

    func refreshViewFetchedFailed() {
        inputCodeView.isHidden = true
        activityIndicator.isHidden = true
    }

    func presentAlertPokemonNotFound(onComplete: @escaping () -> Void = {/* Default empty block*/}) {
        let alert = UIAlertController(title: R.string.localizable.search_pokemon_alert_title.key.localized,
                                      message: R.string.localizable.search_pokemon_alert_message.key.localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.localizable.search_pokemon_alert_button.key.localized,
                                      style: .default,
                                      handler: {action in
            switch action.style{
            case .default:
                onComplete()
            default: return
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}
