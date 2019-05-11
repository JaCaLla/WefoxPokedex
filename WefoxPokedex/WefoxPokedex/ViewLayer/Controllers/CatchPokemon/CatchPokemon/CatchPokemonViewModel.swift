//
//  CatchPokemonViewModel.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

enum CatchPokemonViewModelState: RawRepresentable,Equatable {
    case checkingCatched(Pokemon)
    case checkedCatched(Bool)
    case addedToBackpack

    func isCheckingCatched() -> Bool { return self == .checkingCatched(Pokemon()) }
    func isCheckedCatched() -> Bool { return self == .checkedCatched(true) }

    // MARK: - RawRepresentable
    typealias RawValue = String

    struct ViewModelStateValue {
        static let checkingCatched = "checkingCatched"
        static let checkedCatched = "checkedCatched"
        static let addedToBackpack = "addedToBackpack"
    }

    init?(rawValue: RawValue) {
        return nil
    }

    var rawValue: RawValue {
        switch self {
        case .checkingCatched: return ViewModelStateValue.checkingCatched
        case .checkedCatched: return ViewModelStateValue.checkedCatched
        case .addedToBackpack: return ViewModelStateValue.addedToBackpack
        }
    }

    // MARK: - Equatable
    static func == (lhs: CatchPokemonViewModelState, rhs: CatchPokemonViewModelState) -> Bool {
        switch (lhs, rhs) {

        // Nothing change for basic cases and we make a strict equality check
        case let (.checkingCatched(lhsPokemon), .checkingCatched(rhsPokemon)):
            return lhsPokemon == rhsPokemon
        case let (.checkedCatched(lhsFound), .checkedCatched(rhsFound)):
            return lhsFound == rhsFound
        case (.addedToBackpack,.addedToBackpack): return true
        default:
            return false
        }
    }
}


class CatchPokemonViewModel {

    var onStateChanged: ((CatchPokemonViewModelState) -> Void) = { _ in /* Default empty state */ }

    // MARK: - Private attributes
    var injectedCatchUseCase = CatchUseCase()
    var pokemon:Pokemon = Pokemon()

    init(pokemon:Pokemon,
         catchUseCase:CatchUseCase = CatchUseCase()) {
        self.pokemon = pokemon
        self.injectedCatchUseCase = catchUseCase
    }

    func start() {
        onStateChanged(.checkingCatched(pokemon))
    }

    func exists(pokemon:Pokemon) {
        injectedCatchUseCase.exists(pokemon: pokemon, onComplete: { [weak self] dataManagerResponse in
            guard let weakSelf = self else { return }
            switch dataManagerResponse {
            case .existsPokemon(let found): weakSelf.onStateChanged(.checkedCatched(found))
            default: return
            }
        })
    }

    func addToBackpack() {
        injectedCatchUseCase.addToBackpack(pokemon: pokemon, onComplete:  { [weak self] dataManagerResponse in
            guard let weakSelf = self else { return }
            switch dataManagerResponse {
            case .addedToBackpack: weakSelf.onStateChanged(.addedToBackpack)
            default:return
            }
        })
    }
}
