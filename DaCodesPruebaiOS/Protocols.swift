//
//  Protocols.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 09/12/20.
//

import UIKit
protocol MoviesViewInput {
    var collectionView: UICollectionView! {get set}
    var dataSource: MoviesDataSource! {get set}
    var itemAction: ((String) -> Void)? {get set}
    var addItem: (() -> Void)? {get set}
    func display(_ items: [MovieItem]?)
}
protocol MoviesModelOutput {
    func modelDidload(_ items: [MovieItem])
    func modelDidloadFail(message:String)
}
protocol DetailModelOutput {
    func modelDidload(_ items: DetailItem)
    func modelDidloadFail(message:String)
}
protocol MovieModelInput {
    func load(reload: Bool)
}
protocol DetailModelInput {
    func load(id: String)
}
protocol DetailViewInput {
    func display(_ item: DetailItem)
}
protocol DetailViewControllerInput {
    func setItem(_ id: String)
}
protocol NetworkingProtocol {
func doRequest(urlEndPoint : String, httpMethod : HTTPMethod,
              parameters: Any?, token: String?, completion: @escaping (Data?, Error?)->Void)
    
}
