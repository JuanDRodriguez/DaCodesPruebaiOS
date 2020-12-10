//
//  NetworkingServices.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import Foundation
class NetworkingServices{
    static let shared:NetworkingServices = NetworkingServices()
    lazy var networkingCore: NetworkingProtocol = {UrlSessionsNetworking()}()
   
    func getMovies(page: Int,complentionHandler:@escaping(Data?,Error?)->Void){
        
        networkingCore.doRequest(urlEndPoint: URLBase.movies.rawValue + URLEndPoint.movies.rawValue + "\(page)", httpMethod: .get, parameters: nil, token: nil, completion: {complentionHandler($0,$1)})
    }
    func getDetailMovie(id: String,complentionHandler:@escaping(Data?,Error?)->Void){
        networkingCore.doRequest(urlEndPoint: URLBase.movies.rawValue + "/\(id)" + URLEndPoint.details.rawValue , httpMethod: .get, parameters: nil, token: nil, completion: {complentionHandler($0,$1)})
    }
}
