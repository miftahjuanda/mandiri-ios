//
//  DiscoverRequest.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal struct DiscoverRequest: RestApi {
    typealias Response = DiscoverEntity
    
    var baseURL: String = NetworkConfig.shared.baseUrl
    var path: String = "3/discover/movie"
    var headers: [String : String]? = [:]
    var queryItems: [URLQueryItem]?
    
    init(page: Int, id: Int) {
        self.queryItems = [
            URLQueryItem(name: "api_key", value: NetworkConfig.shared.apiKey),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "with_genres", value: "\(id)")
        ]
    }
    
    func map(_ data: Data) throws -> DiscoverEntity {
        let data = try JSONDecoder().decode(DiscoverResponse.self, from: data)
        let processor = DataProcessor().mapToDiscoverEntity(discover: data)
        
        return processor
    }
}
