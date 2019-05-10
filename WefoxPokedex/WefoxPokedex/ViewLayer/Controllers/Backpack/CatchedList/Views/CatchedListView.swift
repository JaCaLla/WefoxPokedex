//
//  CatchedListView.swift
//  WefoxPokedex
//
//  Created by Javier Calatrava Llaveria on 10/05/2019.
//  Copyright © 2019 Javier Calatrava Llaveria. All rights reserved.
//

import UIKit

class CatchedListView: UICollectionView {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!

    // MARK: - Callbacks
    var onSelected: (Pokemon) -> Void = { _ in /* Default empty block */}

    // MARK: - Private attriburtes
    private var pokemons:[Pokemon] = []

    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

    // MARK: - Public helpers
    func set(pokemons:[Pokemon]) {
        self.pokemons = pokemons
        self.reloadData()
    }

    // MARK: - Private/Internal
    func setupView() {
         self.collectionViewFlowLayout.backpacklowLayout(view: self)
         self.dataSource = self
         self.delegate = self
    }

}

extension CatchedListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let catchedPokemonCVC:CatchedPokemonCVC = self.dequeueReusableCell(withReuseIdentifier:R.reuseIdentifier.catchedPokemonCVC.identifier, for: indexPath) as? CatchedPokemonCVC else {
            return UICollectionViewCell()
        }
        catchedPokemonCVC.set(pokemon: pokemons[indexPath.row])
        return catchedPokemonCVC
    }
}

extension CatchedListView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < pokemons.count else { return }
        onSelected(pokemons[indexPath.row])
    }
}

extension UICollectionViewFlowLayout {

    func backpacklowLayout(view: UIView) {

        let numItemsPerRow: CGFloat = 5
        let marginWidth: CGFloat = 15
        let numMargins: CGFloat = numItemsPerRow + 1

        let sideSize = floor((view.frame.size.width - (numMargins + 1 )*marginWidth ) / numItemsPerRow)

        self.itemSize = CGSize(width: sideSize, height: sideSize +  10.0)
        self.minimumInteritemSpacing = 0//marginWidth
        self.minimumLineSpacing = 0// marginWidth
        self.scrollDirection = .vertical
        self.sectionInset = UIEdgeInsets(top: 0,
                                         left: marginWidth / 2,
                                         bottom: 0,
                                         right: marginWidth / 2)
    }

}
