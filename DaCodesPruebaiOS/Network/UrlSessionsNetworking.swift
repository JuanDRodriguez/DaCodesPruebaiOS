//
//  UrlSessionsNetworking.swift
//  DaCodesPruebaiOS
//
//  Created by Juan Daniel Rodriguez Perez on 10/12/20.
//

import Foundation
class UrlSessionsNetworking: NetworkingProtocol{
    func doRequest(urlEndPoint: String, httpMethod: HTTPMethod, parameters: Any?, token: String?, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlEndPoint) else {
                  completion(nil, NetworkError.incorrectUrl)
                  return
              }
              var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 200.0)
              urlRequest.httpMethod = httpMethod.rawValue
              
              if let params = parameters as? [String: Any] {
                  guard let dParameters = try? JSONSerialization.data( withJSONObject: params, options: []) else {
                      completion(nil, NetworkError.parametersSerialization)
                      return
                  }
                  
                  urlRequest.httpBody = dParameters
              }
              if let arrayParams = parameters as? [[String: Any]] {
                  guard let dParameters = try? JSONSerialization.data( withJSONObject: arrayParams, options: []) else {
                      completion(nil, NetworkError.parametersSerialization)
                      return
                  }
                  
                  urlRequest.httpBody = dParameters
              }
              if let token = token {
                  urlRequest.addValue(token, forHTTPHeaderField: "Authorization")
              }
             
       
              
              let urlSession = URLSession(configuration: .default)
              
              let task = urlSession.dataTask(with: urlRequest) {
                  (data, response, error) -> Void in
                  DispatchQueue.main.async {
                    
                  guard let httpResponse = response as? HTTPURLResponse  else {
                      completion(nil, NetworkError.unknownError)
                      return
                  }
                      
                  if !(200 ... 299).contains(httpResponse.statusCode) {
                     
                    completion(nil, NetworkError.httpResponse)
                      return
                  }
                  guard error == nil else {
                      completion(nil, error)
                      return
                  }
                    
                  completion(data, nil)
                   }
              }
              task.resume()
    }
    
    
}
