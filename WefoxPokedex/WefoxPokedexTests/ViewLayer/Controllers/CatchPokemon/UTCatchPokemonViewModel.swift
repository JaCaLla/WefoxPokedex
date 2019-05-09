//
//  UTCatchPokemonViewModel.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTCatchPokemonViewModel: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DataManager.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_start() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let asyncExpectation = expectation(description: "\(#function)")

        let catchPokemonViewModel = CatchPokemonViewModel(pokemon: Pokemon())
        // var expected = PersonDetailViewModelState.save(person1)

        let expectedSeq:[CatchPokemonViewModelState] = [CatchPokemonViewModelState.checkingCatched(Pokemon())]
        var index = 0
        catchPokemonViewModel.onStateChanged = { SearchPokemonViewModelState in
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
        catchPokemonViewModel.start()

        self.waitForExpectations(timeout:10, handler: nil)
    }

    func test_existsNotFound() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        let catchPokemonViewModel = CatchPokemonViewModel(pokemon: pokemon)
        // var expected = PersonDetailViewModelState.save(person1)



        let expectedSeq:[CatchPokemonViewModelState] = [CatchPokemonViewModelState.checkingCatched(pokemon),
                                                        CatchPokemonViewModelState.checkedCatched(false)]
        var index = 0
        catchPokemonViewModel.onStateChanged = { catchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index] == catchPokemonViewModelState else {

                XCTFail("Failed step: \(index)")
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }

        catchPokemonViewModel.start()
        catchPokemonViewModel.exists(pokemon: pokemon)

        self.waitForExpectations(timeout:10, handler: nil)
    }


    func test_existsFound() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        let catchPokemonViewModel = CatchPokemonViewModel(pokemon: pokemon)


        let expectedSeq:[CatchPokemonViewModelState] = [CatchPokemonViewModelState.checkingCatched(pokemon),
                                                        CatchPokemonViewModelState.checkedCatched(true)]
        var index = 0
        catchPokemonViewModel.onStateChanged = { catchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index] == catchPokemonViewModelState else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }

        catchPokemonViewModel.start()
        DBManager.shared.create(pokemon: pokemon, completion: {
            catchPokemonViewModel.exists(pokemon: pokemon)
        })


        self.waitForExpectations(timeout:10, handler: nil)
    }

    func test_addToBackpack() {

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        let catchPokemonViewModel = CatchPokemonViewModel(pokemon: pokemon)
        // var expected = PersonDetailViewModelState.save(person1)



        let expectedSeq:[CatchPokemonViewModelState] = [CatchPokemonViewModelState.checkingCatched(pokemon),
                                                        CatchPokemonViewModelState.checkedCatched(false),
                                                        CatchPokemonViewModelState.addedToBackpack]
        var index = 0
        catchPokemonViewModel.onStateChanged = { catchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index] == catchPokemonViewModelState else {

                XCTFail("Failed step: \(index)")
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }

        catchPokemonViewModel.start()
        catchPokemonViewModel.exists(pokemon: pokemon)
        catchPokemonViewModel.addToBackpack()
        

        self.waitForExpectations(timeout:10, handler: nil)
    }
}
