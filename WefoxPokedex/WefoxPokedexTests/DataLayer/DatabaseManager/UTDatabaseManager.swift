//
//  UTDatabaseManager.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTDatabaseManager: XCTestCase {

    let timeout:Double = 10.0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.ç
        DBManager.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_existsPokemon() {

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])
        
        XCTAssertFalse(DBManager.shared.exists(pokemon: pokemon))
        DBManager.shared.create(pokemon: pokemon, completion: {
            XCTAssertTrue(DBManager.shared.exists(pokemon: pokemon))
            asyncExpectation.fulfill()
        })
        self.waitForExpectations(timeout: self.timeout, handler: nil)

    }

    func test_getCatchedPockemonsSorted() {

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 33, name: "3", order: 3, weight: 3, height: 3, frontDefaultUrlStr: "https://ss", baseExperience:55,types: ["uno","dos"])

        DBManager.shared.create(pokemon: pokemon, completion: {
            let pokemon = Pokemon(idRest: 1, name: "1", order: 1, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])
            DBManager.shared.create(pokemon: pokemon, completion: {
                let pokemon = Pokemon(idRest: 2, name: "2", order: 2, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])
                DBManager.shared.create(pokemon: pokemon, completion: {
                    let pokemons = DBManager.shared.getCatchedPockemons()
                    XCTAssertEqual(pokemons.count, 3)
                    XCTAssertEqual(pokemons[0].order, 1)
                    XCTAssertEqual(pokemons[0].name, "1")
                    XCTAssertEqual(pokemons[1].order, 2)
                    XCTAssertEqual(pokemons[1].name, "2")
                    XCTAssertEqual(pokemons[2].order, 3)
                    XCTAssertEqual(pokemons[2].name, "3")
                    asyncExpectation.fulfill()
                })
            })
        })
        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }
}


