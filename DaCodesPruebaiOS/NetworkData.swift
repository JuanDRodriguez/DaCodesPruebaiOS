//
//  NetworkData.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 09/12/20.
//

import Foundation
public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
}
public enum URLBase: String {
    case movies     = "https://api.themoviedb.org/3/movie"
    case images    = "https://image.tmdb.org/t/p/w500"
}
public enum URLEndPoint: String{
    case movies = "/now_playing?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES&page="
    case details = "?api_key=634b49e294bd1ff87914e7b9d014daed&language=es-ES"
}
enum NetworkError: Error {
    case unknownError
    case dataError
    case timeOutError
    case incorrectUrl
    case parametersSerialization
    case httpResponse
}
