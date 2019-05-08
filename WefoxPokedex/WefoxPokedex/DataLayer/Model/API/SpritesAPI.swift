//
//  PokemonAPI.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

struct SpritesAPI {
    var frontDefault:String = ""
}

extension SpritesAPI:Decodable {
    enum SpritesAPIKeys: String, CodingKey {
        case frontDefault = "front_default"
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: SpritesAPIKeys.self)
        let frontDefault = try container.decode(String.self, forKey: .frontDefault)

        self.init(frontDefault: frontDefault)
    }
}
