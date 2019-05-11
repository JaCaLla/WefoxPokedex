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
    func getPokemon(id:Int? = nil ,onComplete: @escaping (DataManagerResponse) -> ()) {
        var randomId = Int.random(in: 0 ... 1000)
        if let uwpTestId = id {
            randomId = uwpTestId
        }
        self.injectedDataManager.getPokemon(id: randomId, onComplete: onComplete)
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
