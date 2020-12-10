//
//  MoviesDataSource.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit
class MoviesDataSource: NSObject {
    var items: [MovieItem] = []
}
extension MoviesDataSource: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: MoviewCollectionViewCell.reuseIdentifier, for: indexPath) as! MoviewCollectionViewCell
        cell.display(item: items[indexPath.item])
        return cell
    }
}
