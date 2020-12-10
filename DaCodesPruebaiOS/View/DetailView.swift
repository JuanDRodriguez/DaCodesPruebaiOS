//
//  DetailView.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import UIKit

class DetailView: UIView, DetailViewInput {
    @IBOutlet weak var lblTitle :UILabel!
    @IBOutlet weak var lblTime :UILabel!
    @IBOutlet weak var lblDate :UILabel!
    @IBOutlet weak var lblRating :UILabel!
    @IBOutlet weak var lblGenre :UILabel!
    @IBOutlet weak var lblDescription :UITextView!
    @IBOutlet weak var imgViewMovie :UIImageView!
    
    func display(_ item: DetailItem) {
        self.lblTitle.text = item.title
        self.lblTime.text = item.time
        self.lblDate.setFormatterDate(dateString: item.date) 
        self.lblRating.text = item.rating
        self.lblGenre.text = item.genre
        self.lblDescription.text = item.description
        self.imgViewMovie.load(urlString: item.img)
    }
}
