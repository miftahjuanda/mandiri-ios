//
//  GenreResponse.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

internal struct GenreResponse: Codable {
    let genres: [Genre]?
}

// MARK: - Genre
internal struct Genre: Codable {
    let id: Int?
    let name: String?
}
