//
//  MoviewCollectionViewCell.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit

class MoviewCollectionViewCell: UICollectionViewCell {
    static var reuseIdentifier: String = "\(String(describing: self))"
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var imgViewMovie: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(10.0)
        self.clipsToBounds = true
        
    }
    func display(item: MovieItem){
        self.lblTitle.text = item.title
        self.lblDate.text = item.date
        self.lblRating.text = item.rating
        self.imgViewMovie.load(urlString: item.img)
    }
}
