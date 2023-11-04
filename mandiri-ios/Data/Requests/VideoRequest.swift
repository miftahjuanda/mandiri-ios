//
//  VideoRequest.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct VideoRequest: RestApi {
    typealias Response = VideoEntity
    
    var baseURL: String = NetworkConfig.shared.baseUrl
    var path: String
    var headers: [String : String]? = [:]
    var queryItems: [URLQueryItem]? = [URLQueryItem(name: "api_key", value: NetworkConfig.shared.apiKey)]
    
    init(id: Int) {
        self.path = "/3/movie/\(id)/videos"
    }
    
    func map(_ data: Data) throws -> VideoEntity {
        let data = try JSONDecoder().decode(VideoResponse.self, from: data)
        let processor = DataProcessor().mapToVideoEntity(video: data)
        
        return processor
    }
}
