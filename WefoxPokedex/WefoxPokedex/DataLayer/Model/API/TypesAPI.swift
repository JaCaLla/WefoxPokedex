//
//  PokemonAPI.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

struct TypesAPI {
    var slot:Int = -1
    var type:TypeAPI = TypeAPI()
}

extension TypesAPI:Decodable {
    enum TypesAPIKeys: String, CodingKey {
        case slot = "slot"
        case type = "type"
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: TypesAPIKeys.self)
        let slot = try container.decode(Int.self, forKey: .slot)
        let type = try container.decode(TypeAPI.self, forKey: .type)

        self.init(slot: slot, type:type)
    }
}
