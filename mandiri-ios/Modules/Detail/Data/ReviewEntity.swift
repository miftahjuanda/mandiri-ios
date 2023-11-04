//
//  ReviewEntity.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 04/11/23.
//

import Foundation

internal struct ReviewEntity: Decodable {
    var id: Int = 0
    var page: Int = 0
    var reviews: [Reviews] = []
    var totalPages: Int = 0
}

internal struct Reviews: Decodable {
    var author: String
    var content: String
    var avatarUrl: String
    var rating: Double
}
