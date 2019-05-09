//
//  BuyCoordinator.swift
//  MVVMRedux
//
//

import Foundation
import UIKit

class BackpackCoordinator {

    // MARK: - Singleton handler
    static let shared =  BackpackCoordinator()

    // MARK: - Private attributes
    private let mainFlowNavigationController =  UINavigationController()


    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    // MARK: - Pulic methods
    func start() -> UINavigationController   {
       return self.presentPeopleList()
    }

    // MARK: - Private/Internal
    private func presentPeopleList() -> UINavigationController {

        let catchedListPresenter = CatchedListPresenter.instantiate()
         catchedListPresenter.modalTransitionStyle = .crossDissolve



        mainFlowNavigationController.viewControllers = [catchedListPresenter]
      //   UIApplication.present(viewController: mainFlowNavigationController, animated: true, completion: nil)

        mainFlowNavigationController.tabBarItem = UITabBarItem(title: "backpack", image: nil, tag: 1)
        return mainFlowNavigationController
    }



}
