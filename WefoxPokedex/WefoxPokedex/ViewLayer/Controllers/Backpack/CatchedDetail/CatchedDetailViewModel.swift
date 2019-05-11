//
//  File.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

enum CatchedDetailViewModelState: RawRepresentable,Equatable {
    case checkingCatched(Pokemon)

    func isCheckingCatched() -> Bool { return self == .checkingCatched(Pokemon()) }

    // MARK: - RawRepresentable
    typealias RawValue = String

    struct ViewModelStateValue {
        static let checkingCatched = "checkingCatched"
    }

    init?(rawValue: RawValue) {
        switch rawValue {
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .checkingCatched: return ViewModelStateValue.checkingCatched
        }
    }

    // MARK: - Equatable
    static func == (lhs: CatchedDetailViewModelState, rhs: CatchedDetailViewModelState) -> Bool {
        switch (lhs, rhs) {

        // Nothing change for basic cases and we make a strict equality check
        case let (.checkingCatched(lhsPokemon), .checkingCatched(rhsPokemon)):
            return lhsPokemon == rhsPokemon
        }
    }
}

class CatchedDetailViewModel {

    var onStateChanged: ((CatchedDetailViewModelState) -> Void) = { _ in /* Default empty state */ }

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
}
