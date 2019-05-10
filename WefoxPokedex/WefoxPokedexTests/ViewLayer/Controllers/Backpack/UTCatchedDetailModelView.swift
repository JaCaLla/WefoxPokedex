//
//  UTCatchedDetailModelView.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTCatchedDetailModelView: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_existsFound() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        let catchedDetailModelView = CatchedDetailViewModel(pokemon: pokemon)


        let expectedSeq:[CatchedDetailViewModelState] = [CatchedDetailViewModelState.checkingCatched(pokemon)]
        var index = 0
        catchedDetailModelView.onStateChanged = { catchedDetailViewModelState in
            guard index < expectedSeq.count else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }
            guard expectedSeq[index] == catchedDetailViewModelState else {
                XCTFail()
                asyncExpectation.fulfill()
                return
            }

            index += 1
            if index == expectedSeq.count {
                asyncExpectation.fulfill()
            }
        }

        catchedDetailModelView.start()



        self.waitForExpectations(timeout:10, handler: nil)
    }

}
