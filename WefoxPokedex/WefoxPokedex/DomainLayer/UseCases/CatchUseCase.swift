//
//  CatchUseCase.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation


class CatchUseCase:NSObject {

    var injectedDataManager = DataManager()

    init(dataManager:DataManager = DataManager()) {
        self.injectedDataManager = dataManager
    }


    // MARK: - Public helpers
    func getPokemon(id:String, onComplete: @escaping (DataManagerResponse) -> ()) {
        guard let uwpId = Int(id) else {
            onComplete(DataManagerResponse.pokemonNotFound)
            return
        }
        self.injectedDataManager.getPokemon(id: uwpId, onComplete: onComplete)
    }

    func exists(pokemon:Pokemon, onComplete: (DataManagerResponse) -> ()) {

        self.injectedDataManager.exists(pokemon: pokemon, onComplete: onComplete)
    }

    func addToBackpack(pokemon:Pokemon , onComplete: (DataManagerResponse) -> ()) {
        var pokemonCathed = pokemon
        pokemonCathed.catched =  NSDate().timeIntervalSince1970
       self.injectedDataManager.addToBackpack(pokemon: pokemonCathed, onComplete: onComplete)
    }

    func getBackpack(onComplete: (DataManagerResponse) -> ()) {
        self.injectedDataManager.getBackpack(onComplete: onComplete)
    }
}
