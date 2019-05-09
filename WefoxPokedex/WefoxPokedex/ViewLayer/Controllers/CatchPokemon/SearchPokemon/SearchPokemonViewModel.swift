//
//  SearchPokemonViewModel.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

enum SearchPokemonViewModelState: RawRepresentable {
    case idle
    case fetching
    case fetched(Pokemon)
    case fetchedNotFound
    case fetchedFailed

    func isInitial() -> Bool { return self == .idle }
    func isFetching() -> Bool { return self == .fetching }
    func isFetched() -> Bool { return self == . fetched(Pokemon())}
    func isFetchedNotFound() -> Bool { return self == .fetchedNotFound }
    func isFetchedFailed() -> Bool { return self == .fetchedFailed }

    // MARK: - RawRepresentable
    typealias RawValue = String

    struct ViewModelStateValue {
        static let initial = "initial"
        static let fetching = "fetching"
        static let fetched = "fetched"
        static let fetchedNotFound = "fetchedNotFound"
        static let fetchedFailed = "fetchedFailed"
    }

    init?(rawValue: RawValue) {
        switch rawValue {
        case ViewModelStateValue.initial: self = .idle
        case ViewModelStateValue.fetching: self = .fetching
        case ViewModelStateValue.fetched: return nil
        case ViewModelStateValue.fetchedNotFound: self = .fetchedNotFound
        case ViewModelStateValue.fetchedFailed : self = .fetchedFailed
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .idle: return ViewModelStateValue.initial
        case .fetching: return ViewModelStateValue.fetching
        case .fetched: return ViewModelStateValue.fetched
        case .fetchedNotFound: return ViewModelStateValue.fetchedNotFound
        case .fetchedFailed: return ViewModelStateValue.fetchedFailed
        }
    }

}

class SearchPokemonViewModel {

    var onStateChanged: ((SearchPokemonViewModelState) -> Void) = { _ in /* Default empty state */ }

    // MARK: - Private attributes
    var injectedCatchUseCase = CatchUseCase()

    init(catchUseCase:CatchUseCase = CatchUseCase()) {
        self.injectedCatchUseCase = catchUseCase
    }

    func start() {
        onStateChanged(.idle)
    }

    func getPokemon(id:String) {
        onStateChanged(.fetching)
        injectedCatchUseCase.getPokemon(id: id, onComplete: { [weak self] dataManagerResponse in
            guard let weakSelf = self else { return }
            switch dataManagerResponse {
            case .fetchedPokemon(let pokemon): weakSelf.onStateChanged(.fetched(pokemon))
            case .pokemonNotFound: weakSelf.onStateChanged(.fetchedNotFound)
            case .networkError: weakSelf.onStateChanged(.fetchedFailed)
            default: return
            }

        })
    }
}
