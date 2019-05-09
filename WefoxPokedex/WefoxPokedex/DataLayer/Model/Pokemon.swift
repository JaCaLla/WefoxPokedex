
//
//  Pokemon.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation

struct Pokemon {

    var idRest:Int = -1
    var name:String = ""
    var order:Int = -1
    var weight:Int = -1
    var height:Int = -1
    var frontDefaultUrlStr: String = ""
    var catched:Double? = nil
    var types:[String] = []

    // MARK : - Constructors/Initializers
    init() {
        /* Construction without parameters */
    }

    init(idRest:Int,
         name:String,
         order:Int,
         weight:Int,
         height:Int,
         frontDefaultUrlStr: String,
         catched:Double? = nil,
         types:[String] ) {
        
        self.idRest = idRest
        self.name = name
        self.order = order
        self.weight = weight
        self.height = height
        self.frontDefaultUrlStr = frontDefaultUrlStr
        self.catched = catched
        self.types = types
    }

    init(pokemonAPI:PokemonAPI) {
        self.init(idRest:pokemonAPI.id,
                  name:pokemonAPI.name,
                  order:pokemonAPI.order,
                  weight:pokemonAPI.weight,
                  height:pokemonAPI.height,
                  frontDefaultUrlStr:pokemonAPI.sprites.frontDefault,
                  catched:nil,
                  types:pokemonAPI.types.map({ $0.type.name }) )
    }

    init(pokemonDb:PokemonDb) {

        self.init(idRest: pokemonDb.idRest,
                  name: pokemonDb.name,
                  order: pokemonDb.order,
                  weight: pokemonDb.weight,
                  height: pokemonDb.height,
                  frontDefaultUrlStr: pokemonDb.frontDefaultUrlStr,
                  types: pokemonDb.types.components(separatedBy: ",").compactMap { String($0) } )
    }

}
