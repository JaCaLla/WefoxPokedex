//
//  PokemonDetailView.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

enum PokemonAttribute : Int {
    case name
    case fromImage
    case weight
    case height

    private static let allValues = [name,fromImage,weight,height]

    static func count() -> Int {
        return PokemonAttribute.allValues.count
    }

    static func get(index:Int) -> PokemonAttribute? {
        guard index < allValues.count else { return nil }
        return PokemonAttribute.allValues[index]
    }

    func getAttributeName() -> String {
        switch self {
        case .name: return R.string.localizable.catch_pokemon_attribute_name.key.localized
        case .weight: return R.string.localizable.catch_pokemon_attribute_weight.key.localized
        case .height: return R.string.localizable.catch_pokemon_attribute_height.key.localized
        default: return ""
        }
    }

    func getAttributeValue(pokemon:Pokemon) -> String {
        switch self {
        case .name: return pokemon.name
        case .fromImage: return pokemon.frontDefaultUrlStr
        case .weight: return String(pokemon.weight)
        case .height: return String(pokemon.height)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, pokemon:Pokemon) -> UITableViewCell {
        switch  self {
        case .name,.weight,.height:
            guard let attributePokemonTVC:AttributePokemonTVC =
                tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.attributePokemonTVC.identifier) as? AttributePokemonTVC else { return UITableViewCell() }
            attributePokemonTVC.set(name: self.getAttributeName(), value: self.getAttributeValue(pokemon: pokemon))
            return attributePokemonTVC

        case .fromImage:
            guard let imagePokemonTVC:ImagePokemonTVC =
                tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.imagePokemonTVC.identifier) as? ImagePokemonTVC else { return UITableViewCell() }
            imagePokemonTVC.set(imageUrlStr: pokemon.frontDefaultUrlStr)
            return imagePokemonTVC
        }
    }
}

class PokemonDetailView: UITableView {

    // MARK:  - Private attributes
    private var pokemon:Pokemon?

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    // MARK: - Public helpers
    func set(pokemon:Pokemon) {
        self.pokemon = pokemon
        self.reloadData()
    }

    // MARK: - Internal/Private
    func setupView() {
        self.tableFooterView = UIView()
        self.backgroundColor = AppColors.CatchPokemon.background
        self.dataSource      =  self
    }

    private func  refreshView() {

        self.reloadData()
    }
}

extension PokemonDetailView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PokemonAttribute.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let pokemonAttribute = PokemonAttribute.get(index: indexPath.row),
              let uwpPokemon = pokemon else {
            return UITableViewCell()
        }
        return pokemonAttribute.tableView(self, cellForRowAt: indexPath, pokemon: uwpPokemon)
    }
}
