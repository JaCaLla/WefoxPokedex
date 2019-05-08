//
//  UTPokemon.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex

class UTPokemon: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_initPokemonAPI() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let pokemonAPI = PokemonAPI(id:666,
                                    name: "patata",
                                    weight: 88,
                                    height: 67,
                                    sprites: SpritesAPI(frontDefault: "url_string"),
                                    baseExperience: 88,
                                    types: [TypesAPI(slot: 23, type: TypeAPI(name: "sss")),TypesAPI(slot: 88, type: TypeAPI(name: "ooo"))])

        let pokemon  = Pokemon(pokemonAPI: pokemonAPI)

        XCTAssertEqual(pokemon.idRest, 666)
        XCTAssertEqual(pokemon.name, "patata")
        XCTAssertEqual(pokemon.weight, 88)
        XCTAssertEqual(pokemon.height, 67)
        XCTAssertEqual(pokemon.frontDefaultUrlStr, "url_string")
        XCTAssertNil(pokemon.catched)
        XCTAssertEqual(pokemon.types, ["sss","ooo"])
    }



}
