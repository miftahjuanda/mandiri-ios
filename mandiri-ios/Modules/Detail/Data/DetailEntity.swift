//
//  DetailEntity.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct DetailEntity: Decodable {
    var id: Int = 0
    var title: String = ""
    var adult: Bool = false
    var genres: String = ""
    var voteAverage: String = ""
    var voteCount: String = ""
    var releaseDate: String = ""
    var productionCountrie: String = ""
    var runtime: String = ""
    var overview: String = ""
    
//    var detailEntity: DetailEntity = .init()
    var videoEntity: VideoEntity = .init()
    var reviewEntity: ReviewEntity = .init()
}

//internal struct DetailInformationEntity: Decodable {
//    var detailEntity: DetailEntity = .init()
//    var videoEntity: VideoEntity = .init()
//    var reviewEntity: [Reviews] = []
//}
