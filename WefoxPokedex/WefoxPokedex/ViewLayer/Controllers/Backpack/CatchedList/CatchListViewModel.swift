//
//  CatchListViewModel.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

enum CatchListViewModelState: RawRepresentable,Equatable {
    case fetching
    case fetched([Pokemon])
    case fetchedNotFound

    // MARK: - RawRepresentable
    typealias RawValue = String

    struct ViewModelStateValue {
         static let fetching = "fetching"
        static let fetched = "fetched"
        static let fetchedNotFound = "fetchedNotFound"
    }

    init?(rawValue: RawValue) {
        switch rawValue {
        case ViewModelStateValue.fetching: self = .fetching
        case ViewModelStateValue.fetched: return nil
        case ViewModelStateValue.fetchedNotFound: self = .fetchedNotFound
         default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .fetching: return ViewModelStateValue.fetching
        case .fetched: return ViewModelStateValue.fetched
        case .fetchedNotFound: return ViewModelStateValue.fetchedNotFound
         }
    }

    // MARK: - Equatable
    static func == (lhs: CatchListViewModelState, rhs: CatchListViewModelState) -> Bool {
        switch (lhs, rhs) {

        // Nothing change for basic cases and we make a strict equality check
        case let (.fetched(lhsPokemon), .fetched(rhsPokemon)):
            return lhsPokemon == rhsPokemon
        case (.fetching,.fetching),(.fetchedNotFound,.fetchedNotFound): return true
        default:
            return false
        }
    }

}

class CatchListViewModel {
    var onStateChanged: ((CatchListViewModelState) -> Void) = { _ in /* Default empty state */ }

    // MARK: - Private attributes
    var injectedCatchUseCase = CatchUseCase()

    init(catchUseCase:CatchUseCase = CatchUseCase()) {
        self.injectedCatchUseCase = catchUseCase
        NotificationCenter.default.addObserver(self, selector: #selector(onPersonDataUpdated),
                                               name: NSNotification.Name(rawValue: DataManager.NotificationId.deletedPerson),
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onPersonDataUpdated),
                                               name: NSNotification.Name(rawValue: DataManager.NotificationId.updatedPerson),
                                               object: nil)
    }

    @objc func onPersonDataUpdated(notification: NSNotification) {
        self.start()
    }

    func start() {
        onStateChanged(.fetching)
  
        self.injectedCatchUseCase.getBackpack(onComplete: { dataManagerResponse in
            switch dataManagerResponse {
            case .backpackList(let pokemons): onStateChanged(.fetched(pokemons))
            default: return
            }
        })
    }
}
