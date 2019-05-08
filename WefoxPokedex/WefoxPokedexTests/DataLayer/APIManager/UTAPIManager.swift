//
//  UTAPIManager.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 07/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//


import XCTest
@testable import WefoxPokedex

class UTAPIManager: XCTestCase {

    let timeout:Double = 10.0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Router
    func testAttributes() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(APIManager.APIRouter.host, "pokeapi.co")
        XCTAssertEqual(APIManager.APIRouter.scheme, "https")
        XCTAssertEqual(APIManager.APIRouter.baseURLString, "https://pokeapi.co")
        XCTAssertEqual(APIManager.APIRouter.version, "v2")
    }

    func testGetPersonsUrl() {

        let getPersons = APIManager.APIRouter.getPokemon
        XCTAssertEqual(getPersons(9999).method, .get)
        XCTAssertEqual(getPersons(9999).path, "/api/v2/pokemon/9999")
        XCTAssertEqual(getPersons(9999).resolveURLRequest().httpMethod ?? "", "GET")

        XCTAssertEqual(getPersons(9999).resolveURLRequest().url?.absoluteString,
                       "https://pokeapi.co/api/v2/pokemon/9999")
    }

    func testGetPokemon0() {
        let asyncExpectation = expectation(description: "\(#function)")

        APIManager().getPersons(page: 0, onSucceed: { pokemonAPI in
            XCTFail()
            asyncExpectation.fulfill()
        }, onFailed: { responseCode in
            XCTAssertEqual(responseCode, ResponseCode.responseValidationFailed)
            asyncExpectation.fulfill()
        })
        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func testGetPokemon1() {
        let asyncExpectation = expectation(description: "\(#function)")

        APIManager().getPersons(page: 1, onSucceed: { pokemonAPI in

            XCTAssertEqual(pokemonAPI.name,"bulbasaur")
            XCTAssertEqual(pokemonAPI.weight,69)
            XCTAssertEqual(pokemonAPI.height,7)
            XCTAssertEqual(pokemonAPI.sprites.frontDefault, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")

            asyncExpectation.fulfill()
        }, onFailed: { responseCode in
            XCTFail()
            asyncExpectation.fulfill()
        })

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func test_GetPokemonServerConnectionFailed() {
        let asyncExpectation = expectation(description: "\(#function)")

        MockAPIRestClientNoConnection.shared.responseCode = ResponseCode.connectivityError

        APIManager(restClient:MockAPIRestClientNoConnection.shared).getPersons(page: 1, onSucceed: { npsRestResponse in
            XCTFail()
            asyncExpectation.fulfill()
        }, onFailed: { responseCode in
            XCTAssertEqual(responseCode, ResponseCode.connectivityError)
            asyncExpectation.fulfill()
        })

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func test_resetInjectedRestClient() {
        let asyncExpectation = expectation(description: "\(#function)")

        MockAPIRestClientNoConnection.shared.responseCode = ResponseCode.connectivityError

        let apiManager = APIManager(restClient:MockAPIRestClientNoConnection.shared)

        apiManager.getPersons(page: 1, onSucceed: { npsRestResponse in
            XCTFail()
            asyncExpectation.fulfill()
        }, onFailed: { responseCode in
            XCTAssertEqual(responseCode, ResponseCode.connectivityError)
            apiManager.reset() // mocked injected rest api client is replaced by the default injected one
            apiManager.getPersons(page: 1, onSucceed: { pokemonAPI in

                XCTAssertEqual(pokemonAPI.name,"bulbasaur")
                XCTAssertEqual(pokemonAPI.weight,69)
                XCTAssertEqual(pokemonAPI.height,7)
                XCTAssertEqual(pokemonAPI.sprites.frontDefault, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")

                asyncExpectation.fulfill()
            }, onFailed: { responseCode in
                XCTFail()
                asyncExpectation.fulfill()
            })
        })

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }
}

