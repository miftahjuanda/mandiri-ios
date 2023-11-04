//
//  DetailRequest.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct DetailRequest: RestApi {
    typealias Response = DetailEntity
    
    var baseURL: String = NetworkConfig.shared.baseUrl
    var path: String
    var headers: [String : String]? = [:]
    var queryItems: [URLQueryItem]? = [URLQueryItem(name: "api_key", value: NetworkConfig.shared.apiKey)]
    
    init(id: Int) {
        self.path = "/3/movie/\(id)"
    }
    
    func map(_ data: Data) throws -> DetailEntity {
        let data = try JSONDecoder().decode(DetailResponse.self, from: data)
        let processor = DataProcessor().mapToDetailEntity(detail: data)
        
        return processor
    }
}
