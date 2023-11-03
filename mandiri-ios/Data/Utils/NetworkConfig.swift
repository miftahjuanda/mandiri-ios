//
//  NetworkConfig.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal class NetworkConfig {
    static let shared = NetworkConfig()
    private init(){}
    
    let baseUrl = "https://api.themoviedb.org"
    let baseUrlPoster = "https://image.tmdb.org/t/p/w500"
    let baseUrlYoutube = "https://www.youtube.com/embed/"
    var apiKey: String { valueApiKey }
    
    private let valueApiKey = "be8b6c8aa9a5f4e240bb6093f9849051"
}
