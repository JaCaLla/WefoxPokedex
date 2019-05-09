//
//  UTDataManager.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTDataManager: XCTestCase {

    let timeout:Double = 10.0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetPokemon1() {
        let asyncExpectation = expectation(description: "\(#function)")

        DataManager.shared.getPokemon(id: 1) { dataManagerResponse in
            switch dataManagerResponse {
            case .fetchedPokemon(let pokemon):
                XCTAssertEqual(pokemon.idRest, 1)
                XCTAssertEqual(pokemon.name, "bulbasaur")
                XCTAssertEqual(pokemon.weight, 69)
                XCTAssertEqual(pokemon.height, 7)
                XCTAssertEqual(pokemon.frontDefaultUrlStr, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")
                XCTAssertNil(pokemon.catched)
                XCTAssertEqual(pokemon.types, ["poison", "grass"])
            default:
                XCTFail()
            }
            asyncExpectation.fulfill()
        }

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func testGetPokemonMinus1() {
        let asyncExpectation = expectation(description: "\(#function)")

        DataManager.shared.getPokemon(id: -11) { dataManagerResponse in
            switch dataManagerResponse {
            case .pokemonNotFound:
                 asyncExpectation.fulfill()
            default:
                 asyncExpectation.fulfill()
                XCTFail()
            }
        }

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func testGetPokemonWithNoConnection() {

         let asyncExpectation = expectation(description: "\(#function)")

        MockAPIRestClientNoConnection.shared.responseCode = ResponseCodeAPI.connectivityError
        let apiManagerNoConnection = APIManager(restClient:MockAPIRestClientNoConnection.shared)

        let dataManager = DataManager(apiManager: apiManagerNoConnection)
        dataManager.getPokemon(id: 1) { dataManagerResponse in
            switch dataManagerResponse {
            case .networkError:
                asyncExpectation.fulfill()
            default:
                asyncExpectation.fulfill()
                XCTFail()
            }
        }
        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }


}
