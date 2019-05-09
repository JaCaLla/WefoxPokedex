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
    case existsPokemon(Bool)
    case addedToBackpack
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
    private var injectedDBManager:DBManager = DBManager.shared

    // MARK: - Initializers
    init(apiManager:APIManager = APIManager(),
         databaseManager:DBManager = DBManager.shared) {

        self.injectedAPIManager = apiManager
        self.injectedDBManager = databaseManager
    }

    // MARK: - Public helpers
    func getPokemon(id:Int, onComplete: @escaping (DataManagerResponse) -> ()) {
        self.injectedAPIManager.getPokemon(id: id, onSucceed: { pokemonAPI in
            onComplete(.fetchedPokemon(Pokemon(pokemonAPI: pokemonAPI)))
        }, onFailed: { responseCodeAPI in
            onComplete(DataManagerResponse(responseCodeAPI: responseCodeAPI))
        })
    }

    func exists(pokemon:Pokemon, onComplete: (DataManagerResponse) -> ()) {
        onComplete(.existsPokemon(injectedDBManager.exists(pokemon: pokemon)))
    }

    func addToBackpack(pokemon:Pokemon, onComplete: (DataManagerResponse) -> ()) {
        injectedDBManager.create(pokemon: pokemon, completion: {
            onComplete(.addedToBackpack)
        })
    }
}


// MARK: - Resetable extension
extension DataManager: Resetable {
    func reset() {
        self.injectedAPIManager.reset()
        self.injectedDBManager.reset()
    }
}
