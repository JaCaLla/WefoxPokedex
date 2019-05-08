//
//  MockNPSAPIRestClient.swift
//  MVVMReduxTests
//
//  Created by 08APO0516 on 04/02/2019.
//  Copyright © 2019 jca. All rights reserved.
//

import Foundation
import Alamofire
import CocoaLumberjack
import CoreFoundation

@testable import WefoxPokedex

class MockAPIRestClientNoConnection: RestClientProtocol {

    static let shared:MockAPIRestClientNoConnection = MockAPIRestClientNoConnection()

    // MARK: - Public attributes
    var responseCode:ResponseCodeAPI = ResponseCodeAPI.connectivityError

    private init() { /*This prevents others from using the default '()' initializer for this class. */ }

    func perform(request urlRequest: URLRequestConvertible, success succeed: @escaping ((PokemonAPI) -> Void), failure failed: @escaping ((ResponseCodeAPI) -> Void)) {
        failed(responseCode)
    }
}
