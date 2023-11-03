//
//  DiscoverEntity.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal struct DiscoverEntity: Codable{
    var page: Int = 0
    var discover: [Discover] = []
    var totalPages: Int = 0
}

// MARK: - Result
internal struct Discover: Codable{
    let id: Int
    let adult: Bool
    let title: String
    let releaseDate: String
    let voteAverage: String
    let posterUrl: String
}
