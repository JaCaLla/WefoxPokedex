//
//  PokemonAPI.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

struct PokemonAPI {
    var name:String = ""
    var weight:Int = -1
    var height:Int = -1
    var sprites:SpritesAPI = SpritesAPI()
}

extension PokemonAPI:Decodable {
    enum PokemonAPIKeys: String, CodingKey {
        case name = "name"
        case weight = "weight"
        case height = "height"
        case sprites = "sprites"
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonAPIKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let weight = try container.decode(Int.self, forKey: .weight)
        let height = try container.decode(Int.self , forKey: .height)
        let sprites = try container.decode(SpritesAPI.self, forKey: .sprites)

        self.init(name: name, weight: weight, height:height, sprites:sprites)
    }
}
