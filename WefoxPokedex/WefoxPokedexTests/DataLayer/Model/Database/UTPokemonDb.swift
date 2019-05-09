//
//  UTPokemonDb.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTPokemonDb: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_initPokemon() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 8, weight: 88, height: 77, frontDefaultUrlStr: "https://ss", types: ["uno","dos"])

        let pokemonDb  = PokemonDb(pokemon: pokemon)

        XCTAssertEqual(pokemonDb.idRest, 666)
        XCTAssertEqual(pokemonDb.name, "patata")
         XCTAssertEqual(pokemonDb.order, 8)
        XCTAssertEqual(pokemonDb.weight, 88)
        XCTAssertEqual(pokemonDb.height, 77)
        XCTAssertEqual(pokemonDb.frontDefaultUrlStr, "https://ss")
        XCTAssertTrue( NSDate().timeIntervalSince1970 - pokemonDb.catched < 0.01 )
        XCTAssertEqual(pokemonDb.types, "uno,dos")
    }


}
