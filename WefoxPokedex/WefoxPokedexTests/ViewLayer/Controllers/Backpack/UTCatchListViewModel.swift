//
//  UTCatchListViewModel.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTCatchListViewModel: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_startEmptyBackpack() {

        let asyncExpectation = expectation(description: "\(#function)")
     let catchListViewModel = CatchListViewModel()
          let expectedSeq:[CatchListViewModelState] = [CatchListViewModelState.fetching,
                                                     CatchListViewModelState.fetched([])]
        var index = 0
        catchListViewModel.onStateChanged = { SearchPokemonViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index] == SearchPokemonViewModelState else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }
        catchListViewModel.start()

        self.waitForExpectations(timeout:10, handler: nil)
    }



    func test_startOnePokemonBackpack() {

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 33, name: "3", order: 3, weight: 3, height: 3, frontDefaultUrlStr: "https://ss", baseExperience:55,types: ["uno","dos"])

        CatchUseCase().addToBackpack(pokemon: pokemon, onComplete: {_ in 
            let catchListViewModel = CatchListViewModel()
            let expectedSeq:[CatchListViewModelState] = [CatchListViewModelState.fetching,
                                                         CatchListViewModelState.fetched([pokemon])]
            var index = 0
            catchListViewModel.onStateChanged = { SearchPokemonViewModelState in
                guard index < expectedSeq.count else {
                    XCTFail()
                    asyncExpectation.fulfill()
                    return
                }
                guard expectedSeq[index] == SearchPokemonViewModelState else {
                    XCTFail()
                    asyncExpectation.fulfill()
                    return
                }

                index += 1
                if index == expectedSeq.count {
                    asyncExpectation.fulfill()
                }
            }
            catchListViewModel.start()

        })



        self.waitForExpectations(timeout:10, handler: nil)
    }

}
