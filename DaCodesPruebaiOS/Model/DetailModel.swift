//
//  DetailModel.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import Foundation
class DetailModel: DetailModelInput {
    var out: DetailModelOutput!
    
    func load(id: String) {
        NetworkingServices.shared.getDetailMovie(id: id){
            [unowned self] in
            if let error = $1 {
                self.out.modelDidloadFail(message: error.localizedDescription)
                return
            }
            guard let data = $0 else {
                self.out.modelDidloadFail(message: "No hay información")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        if let time = json["runtime"] as? Int,
                        let title = json["original_title"] as? String,
                        let rating  = json["vote_average"] as? Double,
                        let img = json["backdrop_path"] as? String,
                        let date = json["release_date"] as? String,
                        let desc = json["overview"] as? String,
                        let genres = json["genres"] as? [[String: Any]]{
                            var genre = ""
                            var i = 0
                            for item in genres{
                                if let gen = item["name"] as? String{
                                    genre += (i==0 ? "":", ") + gen
                                }
                                i += 1
                            }
                            self.out.modelDidload(DetailItem.init(genre: genre, time: String(time) + " min", description: desc, title: title, rating: String(rating), img: img, date: date))
                      }
                  }
            }
            catch let error {
                self.out.modelDidloadFail(message: error.localizedDescription)
            }
        }
    }
    
    
}
