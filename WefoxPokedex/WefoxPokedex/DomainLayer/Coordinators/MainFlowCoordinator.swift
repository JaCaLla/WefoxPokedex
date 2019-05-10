//
//  MainFlowCoordinator.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

class MainFlowCoordinator {

    // MARK: - Singleton handler
    static let shared =  MainFlowCoordinator()

    // MARK: - Private attributes
    private let tabBarController =  UITabBarController()


    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    // MARK: - Pulic methods
    func start()   {
       return self.presentPeopleList()
    }

    // MARK: - Private/Internal
    private func presentPeopleList()  {

        tabBarController.viewControllers = [CatchPokemonCoordinator.shared.start(),
                                                BackpackCoordinator.shared.start()]

        UIApplication.present(viewController: tabBarController, animated: true, completion: nil)
    }



}
