//
//  PokemonDb.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import RealmSwift

class PokemonDb: Object {

    @objc dynamic var idRest:Int = -1
    @objc dynamic var name:String = ""
    @objc dynamic var order:Int = -1
    @objc dynamic var weight:Int = -1
    @objc dynamic var height:Int = -1
    @objc dynamic var frontDefaultUrlStr: String = ""
    @objc dynamic var catched:Double = NSDate().timeIntervalSince1970
    @objc dynamic var baseExperience:Int  = -1
    dynamic var types: String = ""

    var pokemon:Pokemon {
        get {
            return Pokemon(pokemonDb: self)
        }
    }

    // MARK: - Initializaers
    convenience init(idRest:Int,
         name:String,
         order:Int,
         weight:Int,
         height:Int,
         frontDefaultUrlStr: String,
         catched:Double = NSDate().timeIntervalSince1970,
         baseExperience:Int,
         types:[String]) {

        self.init()
        self.idRest = idRest
        self.name = name
        self.order = order
        self.weight = weight
        self.height = height
        self.frontDefaultUrlStr = frontDefaultUrlStr
        self.catched = catched
        self.baseExperience = baseExperience
        self.types = types.map { String(describing: $0) }.joined(separator: ",")
    }

    convenience init(pokemon:Pokemon) {
        self.init(idRest:pokemon.idRest,
                  name:pokemon.name,
                  order:pokemon.order,
                  weight:pokemon.weight,
                  height:pokemon.height,
                  frontDefaultUrlStr:pokemon.frontDefaultUrlStr,
                  catched:pokemon.catched ?? NSDate().timeIntervalSince1970,
                  baseExperience:pokemon.baseExperience,
                  types:pokemon.types)
    }

    // MARK: - Realm
    override class func primaryKey() -> String? {
        return "idRest"
    }

    override class func indexedProperties() -> [String] {
        return ["idRest"]
    }

    override static func ignoredProperties() -> [String] {
        return []
    }

}
