//
//  AlamofireHttpClient.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Alamofire

internal protocol HTTPClient {
    func request<T: RestApi>(url: T, completion: @escaping (Result<T.Response, RequestError>) -> Void)
}

internal final class AlamofireHttpClient: NSObject, HTTPClient {
    public override init() {}
    
    func request<T>(url: T, completion: @escaping (Result<T.Response, RequestError>) -> Void) where T : RestApi {
        
        AF.request(url.toUrlRequest()).responseData { response in
            if let error = response.error {
                let error = error as NSError
                switch error.code {
                case -1009: // don't have inet connection
                    completion(.failure(.anyError("Don't have internet connection.")))
                case -1001: // request timeout
                    completion(.failure(.anyError("Request timeout.")))
                default:
                    completion(.failure(.sessionError(error: error)))
                }
            } else if let data = response.data {
                if let mapData = try? url.map(data) {
                    completion(.success(mapData))
                } else {
                    completion(.failure(.anyError("Error mapping data.")))
                }
            } else {
                if let error = response.error {
                    completion(.failure(.sessionError(error: error)))
                } else {
                    completion(.failure(.anyError("Error undifine.")))
                }
            }
        }
    }
}

internal enum RequestError: Error {
    case sessionError(error: Error)
    case anyError(String)
}
