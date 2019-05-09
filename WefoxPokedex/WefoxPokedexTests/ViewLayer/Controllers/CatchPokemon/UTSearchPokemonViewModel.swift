//
//  UTSearchPokemonViewModel.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTSearchPokemonViewModel: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_start() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let asyncExpectation = expectation(description: "\(#function)")

        let searchPokemonViewModel = SearchPokemonViewModel()
        // var expected = PersonDetailViewModelState.save(person1)

        let expectedSeq:[SearchPokemonViewModelState] = [SearchPokemonViewModelState.idle]
        var index = 0
        searchPokemonViewModel.onStateChanged = { SearchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index].rawValue == SearchPokemonViewModelState.rawValue else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }
        searchPokemonViewModel.start()

        self.waitForExpectations(timeout:10, handler: nil)
    }

    func test_getPokemon() {

        let asyncExpectation = expectation(description: "\(#function)")

        let searchPokemonViewModel = SearchPokemonViewModel()
        // var expected = PersonDetailViewModelState.save(person1)

        let expectedSeq:[SearchPokemonViewModelState] = [SearchPokemonViewModelState.idle,
        SearchPokemonViewModelState.fetching,
        SearchPokemonViewModelState.fetched(Pokemon())]
        var index = 0
        searchPokemonViewModel.onStateChanged = { SearchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index].rawValue == SearchPokemonViewModelState.rawValue else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }
        searchPokemonViewModel.start()
        searchPokemonViewModel.getPokemon(id: "5")

        self.waitForExpectations(timeout:10, handler: nil)
    }

    func test_getPokemon_IdNotFound() {

        let asyncExpectation = expectation(description: "\(#function)")

        let searchPokemonViewModel = SearchPokemonViewModel()
          let expectedSeq:[SearchPokemonViewModelState] = [SearchPokemonViewModelState.idle,
                                                         SearchPokemonViewModelState.fetching,
                                                         SearchPokemonViewModelState.fetchedNotFound]
        var index = 0
        searchPokemonViewModel.onStateChanged = { SearchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index].rawValue == SearchPokemonViewModelState.rawValue else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }
        searchPokemonViewModel.start()
        searchPokemonViewModel.getPokemon(id: "123456789")

        self.waitForExpectations(timeout:10, handler: nil)
    }

}
