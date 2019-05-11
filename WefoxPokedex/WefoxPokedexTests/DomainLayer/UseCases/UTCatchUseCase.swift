//
//  UTCatchUseCase.swift
//  WefoxPokedexTests
//
//  Created by Javier Calatrava Llaveria on 09/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import XCTest
@testable import WefoxPokedex
class UTCatchUseCase: XCTestCase {

    let timeout:Double = 10.0

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        DataManager.shared.reset()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_getPokemon() {

        let asyncExpectation = expectation(description: "\(#function)")

        CatchUseCase().getPokemon(id: 10, onComplete: { dataManagerResponse in
            switch dataManagerResponse {
            case .fetchedPokemon(let pokemon):
                XCTAssertEqual(pokemon.idRest, 10)
            default:
                XCTFail()
            }
            asyncExpectation.fulfill()
        })
        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func test_existPokemon()  {

        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        CatchUseCase().exists(pokemon: pokemon, onComplete: { dataManagerResponse in
            switch dataManagerResponse {
            case .existsPokemon(let found):
                XCTAssertEqual(found,false)
                DBManager.shared.create(pokemon: pokemon, completion: {
                    DataManager.shared.exists(pokemon: pokemon, onComplete: { dataManagerResponse in
                        switch dataManagerResponse {
                        case .existsPokemon(let found):
                            XCTAssertEqual(found,true)
                            asyncExpectation.fulfill()
                        default:
                            asyncExpectation.fulfill()
                            XCTFail()
                        }
                    })
                })
            default:
                asyncExpectation.fulfill()
                XCTFail()
            }
        })
        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

    func test_addToBackpack() {
        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 666, name: "patata", order: 9, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        CatchUseCase().exists(pokemon: pokemon, onComplete: { dataManagerResponse in
            switch dataManagerResponse {
            case .existsPokemon(let found):
                XCTAssertEqual(found,false)

                CatchUseCase().addToBackpack(pokemon: pokemon, onComplete: { dataManagerResponse in
                    switch dataManagerResponse {
                    case .addedToBackpack:
                        CatchUseCase().exists(pokemon: pokemon, onComplete: { dataManagerResponse in
                            switch dataManagerResponse {
                            case .existsPokemon(let found):
                                XCTAssertEqual(found,true)
                                asyncExpectation.fulfill()
                            default:
                                asyncExpectation.fulfill()
                                XCTFail()
                            }
                        })

                    default:
                        asyncExpectation.fulfill()
                        XCTFail()
                    }
                })

            default:
                asyncExpectation.fulfill()
                XCTFail()
            }
        })

        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }


    func test_getBackpack() {
        let asyncExpectation = expectation(description: "\(#function)")

        let pokemon = Pokemon(idRest: 3, name: "patata", order: 3, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

        CatchUseCase().addToBackpack(pokemon: pokemon, onComplete: { dataManagerResponse in
            switch dataManagerResponse {
            case .addedToBackpack:

                let pokemon = Pokemon(idRest: 1, name: "patata", order: 1, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

                CatchUseCase().addToBackpack(pokemon: pokemon, onComplete: { dataManagerResponse in
                    switch dataManagerResponse {
                    case .addedToBackpack:
                        let pokemon = Pokemon(idRest: 2, name: "patata", order: 2, weight: 88, height: 77, frontDefaultUrlStr: "https://ss",baseExperience:55, types: ["uno","dos"])

                       CatchUseCase().addToBackpack(pokemon: pokemon, onComplete: { dataManagerResponse in
                            switch dataManagerResponse {
                            case .addedToBackpack:

                                CatchUseCase().getBackpack(onComplete: { dataManagerResponse in
                                    switch dataManagerResponse {
                                    case .backpackList(let pokemons):
                                        guard pokemons.count == 3 else {
                                            XCTFail()
                                            asyncExpectation.fulfill()
                                            return
                                        }
                                        XCTAssertEqual(pokemons[0].order, 1)
                                        XCTAssertEqual(pokemons[1].order, 2)
                                        XCTAssertEqual(pokemons[2].order, 3)
                                        asyncExpectation.fulfill()
                                    default :
                                        XCTFail()
                                        asyncExpectation.fulfill()
                                    }
                                })
                            default:
                                asyncExpectation.fulfill()
                                XCTFail()
                            }
                        })

                    default:
                        asyncExpectation.fulfill()
                        XCTFail()
                    }
                })

            default:
                asyncExpectation.fulfill()
                XCTFail()
            }
        })


        self.waitForExpectations(timeout: self.timeout, handler: nil)
    }

}
