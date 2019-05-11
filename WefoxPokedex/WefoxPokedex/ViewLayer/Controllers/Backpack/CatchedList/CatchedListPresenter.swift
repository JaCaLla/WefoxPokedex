//
//  CatchedListPresenter.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchedListPresenter: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var catchedListView: CatchedListView!

    // MARK: - Callbacks
    var onSelected: (Pokemon) -> Void = { _ in /* Default empty block */}

    // MARK: - Constructor/Initializer
    static func instantiate(catchListViewModel:CatchListViewModel = CatchListViewModel()) -> CatchedListPresenter {
        let catchedListPresenter = CatchedListPresenter.instantiate(fromAppStoryboard: .backpack)
        catchedListPresenter.injectedCatchListViewModel = catchListViewModel
        return catchedListPresenter
    }


    // MARK: - Privvate attributes
    private var injectedCatchListViewModel:CatchListViewModel = CatchListViewModel()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        injectedCatchListViewModel.start()
    }

    // MARK: - Private/Internal
    private func setupPresenter() {
        self.title = R.string.localizable.tab_backpack.key.localized
        self.view.backgroundColor = AppColors.CatchedDetail.background
        
        injectedCatchListViewModel.onStateChanged = { [weak self] newViewModelState in
            DispatchQueue.main.async {
                guard let weakSelf = self else { return }
                weakSelf.refreshView(catchListViewModelState: newViewModelState)
            }
        }
        injectedCatchListViewModel.start()

        catchedListView.onSelected = onSelected
    }

    private func refreshView(catchListViewModelState:CatchListViewModelState) {
        switch catchListViewModelState {
        case .fetching: refreshViewFetching()
        case .fetched(let pokemons): refreshViewFetched(pokemons:pokemons)
        case .fetchedNotFound: refreshViewFetchedNotFound()
        }
    }
    
    func refreshViewFetching() {

    }

    func refreshViewFetched(pokemons:[Pokemon]) {
        catchedListView.set(pokemons: pokemons)
    }

    func refreshViewFetchedNotFound() {

    }
}
