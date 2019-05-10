//
//  BackpackCoordinator.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

class BackpackCoordinator {

    // MARK: - Singleton handler
    static let shared =  BackpackCoordinator()

    // MARK: - Private attributes
    private let navigationController =  UINavigationController()


    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    // MARK: - Pulic methods
    func start() -> UINavigationController   {
       return self.presentPeopleList()
    }

    // MARK: - Private/Internal
    private func presentPeopleList() -> UINavigationController {

        let catchedListPresenter = CatchedListPresenter.instantiate()
         catchedListPresenter.modalTransitionStyle = .crossDissolve
        catchedListPresenter.onSelected = { [weak self] pokemon in
            guard let weakSelf = self else { return }
            weakSelf.presentPokemonDetail(pokemon: pokemon)
        }

        navigationController.viewControllers = [catchedListPresenter]
        navigationController.tabBarItem = UITabBarItem(title:  R.string.localizable.tab_backpack.key.localized, image: nil, tag: 1)
        return navigationController
    }

    func presentPokemonDetail(pokemon:Pokemon) {
        let catchedDetailModelView = CatchedDetailViewModel(pokemon: pokemon)
        let catchedDetailPresenter = CatchedDetailPresenter.instantiate(catchedDetailModelView: catchedDetailModelView)
        self.navigationController.pushViewController(catchedDetailPresenter, animated: true)
    }
}
