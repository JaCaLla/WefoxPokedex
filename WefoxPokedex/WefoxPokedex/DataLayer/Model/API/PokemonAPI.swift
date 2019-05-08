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
    var id:Int              = -2
    var name:String         = ""
    var weight:Int          = -1
    var height:Int          = -1
    var sprites:SpritesAPI  = SpritesAPI()
    var baseExperience:Int  = -1
    var types:[TypesAPI]    = []
}

extension PokemonAPI:Decodable {
    enum PokemonAPIKeys: String, CodingKey {
        case id             = "id"
        case name           = "name"
        case weight         = "weight"
        case height         = "height"
        case sprites        = "sprites"
        case baseExperience = "base_experience"
        case types          = "types"
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonAPIKeys.self)
        let id = try container.decode(Int.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let weight = try container.decode(Int.self, forKey: .weight)
        let height = try container.decode(Int.self , forKey: .height)
        let sprites = try container.decode(SpritesAPI.self, forKey: .sprites)
        let baseExperience = try container.decode(Int.self , forKey: .baseExperience)
        let types = try container.decode([TypesAPI].self , forKey: .types)

        self.init(id:id,
                  name: name,
                  weight: weight,
                  height:height,
                  sprites:sprites,
                  baseExperience:baseExperience,
                  types:types)
    }
}
