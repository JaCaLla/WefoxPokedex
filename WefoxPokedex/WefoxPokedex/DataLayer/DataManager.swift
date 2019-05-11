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
    case backpackList([Pokemon])
    case pokemonNotFound
    case networkError

    init(responseCodeAPI:ResponseCodeAPI) {
        if responseCodeAPI == .responseValidationFailed {
            self = .pokemonNotFound
        } else {
            self = .networkError
        }
    }
}

final class DataManager {

    static let shared:DataManager = DataManager()

    // MARK: - Constants
    struct NotificationId {
        static let deletedPerson = "DataManager.deletedPerson"
        static let updatedPerson = "DataManager.updatedPerson"
    }

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
            let notificationCenter = NotificationCenter.default
            notificationCenter.post(name: NSNotification.Name(rawValue: DataManager.NotificationId.deletedPerson),
                                    object: nil)
            onComplete(.addedToBackpack)
        })
    }

    func getBackpack(onComplete: (DataManagerResponse) -> ()) {

        onComplete(.backpackList(injectedDBManager.getCatchedPockemons()))
    }
}


// MARK: - Resetable extension
extension DataManager: Resetable {
    func reset() {
        self.injectedAPIManager.reset()
        self.injectedDBManager.reset()
    }
}
