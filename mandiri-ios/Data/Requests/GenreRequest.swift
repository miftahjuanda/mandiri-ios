//
//  GenreRequest.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal struct GenreRequest: RestApi {
    typealias Response = [GenreEntity]
    
    var baseURL: String = NetworkConfig.shared.baseUrl
    var path: String = "/3/genre/movie/list"
    var headers: [String : String]? = [:]
    var queryItems: [URLQueryItem]? = [URLQueryItem(name: "api_key", value: NetworkConfig.shared.apiKey)]
    
    func map(_ data: Data) throws -> [GenreEntity] {
        let data = try JSONDecoder().decode(GenreResponse.self, from: data)
        let processor = DataProcessor().mapToGenreEntity(genre: data)
        
        return processor
    }
}
