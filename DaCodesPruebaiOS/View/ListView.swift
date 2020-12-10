//
//  ListView.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 09/12/20.
//

import UIKit

class ListView: UIView {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var dataSource: MoviesDataSource!{
    didSet{
        self.collectionView.dataSource = dataSource
        }
    }
    var itemAction: ((String) -> Void)?
    var addItem: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.activityIndicator.startAnimating()
        self.collectionView.register(UINib(nibName: "MoviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MoviewCollectionViewCell.reuseIdentifier)
    }

}
extension ListView: MoviesViewInput{
    
    func display(_ items: [MovieItem]?) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        if let data = items{
            self.dataSource.items = data
        }
        self.collectionView.reloadData()
        
    }
    
    
}
extension ListView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.itemAction?(dataSource.items[indexPath.item].id)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.frame.size.width - 12) / 2
        return CGSize(width: width, height: 280)
    }
   
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        if offsetY > height - scrollView.frame.size.height{
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
            self.addItem?()
        }
    }
}
