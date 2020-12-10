//
//  MovieItem.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import Foundation
class MovieItem {
    var id: String
    var title: String
    var rating: String
    var img: String
    var date: String
    init(id: String, title: String, rating: String,img: String,date: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.img = img
        self.date = date
    }
}
class DetailItem: MovieItem {
    var genre: String!
    var time: String!
    var description: String!
    init(genre:String,time:String,description:String,title: String, rating: String,img: String,date: String) {
        super.init(id: "", title: title, rating: rating, img: img, date: date)
        self.description = description
        self.time = time
        self.genre = genre
    }
    
}
