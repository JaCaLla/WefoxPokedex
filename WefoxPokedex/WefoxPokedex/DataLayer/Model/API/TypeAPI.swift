//
//  PokemonAPI.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 08/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import Foundation
import UIKit

struct TypeAPI {
    var name:String = ""
}

extension TypeAPI:Decodable {
    enum TypeAPIKeys: String, CodingKey {
        case name = "name"
    }

    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: TypeAPIKeys.self)
        let name = try container.decode(String.self, forKey: .name)

        self.init(name: name)
    }
}
