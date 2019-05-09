//
//  DataManager.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

enum DataManagerResponse {
    case fetchedPokemon(Pokemon)
    case pokemonNotFound
    case networkError

    init(responseCodeAPI:ResponseCodeAPI) {
        switch responseCodeAPI {
        case .responseValidationFailed: self = .pokemonNotFound
        default:                        self = .networkError
        }
    }
}

final class DataManager {

    static let shared:DataManager = DataManager()

    // MARK: - Injected attributes
    private var injectedAPIManager:APIManager = APIManager()

    // MARK: - Initializers
    init(apiManager:APIManager = APIManager()) {

        self.injectedAPIManager = apiManager
    }

    // MARK: - Public helpers
    func getPokemon(id:Int, onComplete: @escaping (DataManagerResponse) -> ()) {
        self.injectedAPIManager.getPokemon(id: id, onSucceed: { pokemonAPI in
            onComplete(.fetchedPokemon(Pokemon(pokemonAPI: pokemonAPI)))
        }, onFailed: { responseCodeAPI in
            onComplete(DataManagerResponse(responseCodeAPI: responseCodeAPI))
        })
    }
}


// MARK: - Resetable extension
extension DataManager: Resetable {
    func reset() {
        self.injectedAPIManager = APIManager()
    }
}
