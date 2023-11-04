//
//  ReviewRequest.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct ReviewRequest: RestApi {
    typealias Response = ReviewEntity
    
    var baseURL: String = NetworkConfig.shared.baseUrl
    var path: String
    var headers: [String : String]? = [:]
    var queryItems: [URLQueryItem]? = [URLQueryItem(name: "api_key", value: NetworkConfig.shared.apiKey)]
    
    init(id: Int) {
        self.path = "/3/movie/\(id)/reviews"
    }
    
    func map(_ data: Data) throws -> ReviewEntity {
        let data = try JSONDecoder().decode(ReviewResponse.self, from: data)
        let processor = DataProcessor().mapToReviewEntity(review: data)
        
        return processor
    }
}
