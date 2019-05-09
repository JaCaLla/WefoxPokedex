//
//  BuyCoordinator.swift
//  MVVMRedux
//
//

import Foundation
import UIKit

final class CatchPokemonCoordinator {

    // MARK: - Singleton handler
    static let shared =  CatchPokemonCoordinator()

    // MARK: - Private attributes
    private let navigationController =  UINavigationController()


    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    // MARK: - Pulic methods
    func start() -> UINavigationController   {
       return self.presentSearchPokemon()
    }

    // MARK: - Private/Internal
    private func presentSearchPokemon() -> UINavigationController {

        let searchPokemonPresenter = SearchPokemonPresenter.instantiate()

        searchPokemonPresenter.onFound = { [weak self] pokemon in
            guard let weakSelf = self else { return }
            weakSelf.presentCatchPokemon(pokemon: pokemon)
        }
         searchPokemonPresenter.modalTransitionStyle = .crossDissolve

        navigationController.viewControllers = [searchPokemonPresenter]

        navigationController.tabBarItem = UITabBarItem(title: "catch", image: nil, tag: 0)
        return navigationController
    }

    private func presentCatchPokemon(pokemon:Pokemon) {
        let catchPokemonViewModel = CatchPokemonViewModel(pokemon: pokemon)
        let catchPokemonPresenter = CatchPokemonPresenter.instantiate(catchPokemonViewModel: catchPokemonViewModel)

        catchPokemonPresenter.onCatchOrLeave = { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.navigationController.popViewController(animated: true)
        }

        self.navigationController.pushViewController(catchPokemonPresenter, animated: true)
    }

}
