//
//  DatabaseManager.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import RealmSwift

extension Realm {

    /// Performs actions contained within the given block
    /// inside a write transaction with completion block.
    ///
    /// - parameter block: write transaction block
    /// - parameter completion: completion executed after transaction block
    func write(transaction block: ( ) -> Void, completion: ( ) -> Void) throws {
        try write(block)
        completion()
    }
}

class DatabaseManager {

    static let shared = DatabaseManager()
    var thread = Thread.current
    var realm: Realm!

    struct UserDefaultKeys {
        static let keyIsAppExecutedOnce = "isAppExecutedOnce"
    }

    private init() {

        setRealmHandlers()
    }

    func create(pokemon: Pokemon, completion: (( ) -> Void)  = { /* Default empty block */ }) {
        self.resetHandlerIfNecessary()
        let pokemonDb:PokemonDb = PokemonDb(pokemon: pokemon)
        do {
            try realm.write(transaction: {
                realm.add(pokemonDb)
            }, completion: {
                completion()
            })
        } catch {
            // handle error
        }
    }

    func exists(pokemon:Pokemon) -> Bool {
        self.resetHandlerIfNecessary()
        return realm.objects(PokemonDb.self).filter("idRest = %@", pokemon.idRest).first != nil
    }

    func getCatchedPockemons() -> [Pokemon] {
        return realm.objects(PokemonDb.self).sorted(byKeyPath: "order").map({Pokemon(pokemonDb: $0)})
    }
    

    // MARK: - Private/Internal
    func resetHandlerIfNecessary() {
        guard thread == Thread.current else {
            self.setRealmHandlers()
            thread = Thread.current
            return
        }
    }

    func setRealmHandlers() {
        do {
            if NSClassFromString("XCTest") != nil {
                realm = try Realm(configuration: RealmConfig.utest.configuration)
            } else {
                realm = try Realm(configuration: RealmConfig.main.configuration)
            }
        } catch {
            // handle error
        }
    }
}

extension DatabaseManager: Resetable {
    func reset() {
        self.resetHandlerIfNecessary()
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            // handle error
        }
    }
}
