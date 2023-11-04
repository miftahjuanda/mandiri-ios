//
//  GenreResponse.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal struct GenreResponse: Decodable {
    let genres: [Genre]?
}

// MARK: - Genre
internal struct Genre: Decodable {
    let id: Int?
    let name: String?
}
