//
//  APIManager.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {

    // MARK: - Router
    enum APIRouter: URLRequestConvertible {
        case getPokemon(Int)

        static let host = "pokeapi.co"
        static let scheme = "https"
        static let baseURLString =  scheme + "://" + host
        static let limitPage:Int = 10

        var method: Alamofire.HTTPMethod {
            switch self {
            case .getPokemon:    return .get
            }
        }

        static func versionNumber() -> Int { return  2 }
        static var version: String {
            return "v\(APIRouter.versionNumber())"
        }

        var path: String {
            switch self {
            case .getPokemon(let pokemonId): return "/api/\(APIManager.APIRouter.version)/pokemon/\(pokemonId)"
            }
        }

        func resolveURLRequest() -> URLRequest {

            guard let url = URL(string: APIRouter.baseURLString) else {
                return URLRequest(url: URL(fileURLWithPath: ""))
            }

            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            urlRequest.httpMethod = method.rawValue

            return urlRequest
        }

        func asURLRequest() throws -> URLRequest {

            switch self {
            case .getPokemon:
                let urlRequest = resolveURLRequest()
                return try Alamofire.JSONEncoding.default.encode(urlRequest, with: nil)
            }
        }
    }

    var injectedRestClient:RestClientProtocol = APIRestClient.shared

    init(restClient:RestClientProtocol = APIRestClient.shared) {
        self.injectedRestClient = restClient
    }

    // MARK: - Service helpers
    func getPersons(page: Int,
                  onSucceed: @escaping ((PokemonAPI) -> Void),
                  onFailed: @escaping ((ResponseCode) -> Void)) {

        self.injectedRestClient.perform(request: APIRouter.getPokemon(page),
                           success: { response in
                            onSucceed(response)
        }, failure: { responseCode in
            onFailed(responseCode)
        })
    }
}

extension APIManager: Resetable {
    func reset() {
        self.injectedRestClient = APIRestClient.shared
    }
}
