//
//  ListModel.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 09/12/20.
//

import Foundation
class ListModel: MovieModelInput {
    var out: MoviesModelOutput!
    var page = 1
    func load(reload:Bool) {
        NetworkingServices.shared.getMovies(page: reload ? 1 : page ){
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
                    var movies: [MovieItem] = []
                      if let items = json["results"] as? [[String: Any]] {
                        
                        for item in items {
                            
                           if let id = item["id"] as? Int,
                            let title = item["original_title"] as? String,
                            let rating  = item["vote_average"] as? Double,
                            let img = item["poster_path"] as? String,
                            var date = item["release_date"] as? String{
                                
                            movies.append(MovieItem.init(id: String(id), title: title, rating: String(rating), img: img, date: date))
                            }
                        }
                        
                        self.page +=  1 
                        self.out.modelDidload(movies)
                      }
                  }
            }
            catch let error {
                self.out.modelDidloadFail(message: error.localizedDescription)
            }
        }
    }
}

