//
//  CatchedDetailView.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

enum CatchedPokemonAttribute : Int {
    case name
    case fromImage
    case catched
    case weight
    case height
    case baseExperience
    case types

    private static let allValues = [name,fromImage,weight,height,catched,baseExperience,types]

    static func count() -> Int {
        return CatchedPokemonAttribute.allValues.count
    }

    static func get(index:Int) -> CatchedPokemonAttribute? {
        guard index < allValues.count else { return nil }
        return CatchedPokemonAttribute.allValues[index]
    }

    func getAttributeName() -> String {
        switch self {
        case .name: return R.string.localizable.catch_pokemon_attribute_name.key.localized
        case .weight: return R.string.localizable.catch_pokemon_attribute_weight.key.localized
        case .height: return R.string.localizable.catch_pokemon_attribute_height.key.localized
        case .catched: return R.string.localizable.catch_pokemon_attribute_catched.key.localized
        case .baseExperience: return R.string.localizable.catch_pokemon_attribute_base_experience.key.localized
        case .types: return R.string.localizable.catch_pokemon_attribute_types.key.localized
        default: return ""
        }
    }

    func getAttributeValue(pokemon:Pokemon) -> String {
        switch self {
        case .name: return pokemon.name
        case .fromImage: return pokemon.frontDefaultUrlStr
        case .weight: return String(pokemon.weight)
        case .height: return String(pokemon.height)
        case .catched: return self.unixTimeToStr(timestamp: pokemon.catched)
        case .baseExperience: return String(pokemon.baseExperience)
        case .types: return pokemon.types.joined(separator: "/")
        }
    }

    func unixTimeToStr(timestamp:Double?) -> String {
        guard let uwpTimestamp = timestamp else {
            return R.string.localizable.catch_pokemon_value_catched_not_catched.key.localized
        }

        let date = Date(timeIntervalSince1970: uwpTimestamp)

        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "MMM dd YYYY hh:mm a"

        return dayTimePeriodFormatter.string(from: date)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, pokemon:Pokemon) -> UITableViewCell {
        switch  self {
        case .name,.weight,.height, .catched,.baseExperience,.types:
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

class CatchedDetailView: UITableView {

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
        self.refreshView()
    }

    // MARK: - Internal/Private
    func setupView() {
        self.tableFooterView = UIView()
        self.backgroundColor = AppColors.CatchedDetail.background
        self.dataSource         =  self
    }

    private func  refreshView() {

        self.reloadData()
    }
}

extension CatchedDetailView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CatchedPokemonAttribute.count()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let pokemonAttribute = CatchedPokemonAttribute.get(index: indexPath.row),
            let uwpPokemon = pokemon else {
                return UITableViewCell()
        }
        return pokemonAttribute.tableView(self, cellForRowAt: indexPath, pokemon: uwpPokemon)
    }
}
