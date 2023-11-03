//
//  DataProcessor.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

protocol ProcessingProtocol {
    func mapToGenreEntity(genre: GenreResponse?) -> [GenreEntity]
}

internal final class DataProcessor: ProcessingProtocol {
    func mapToGenreEntity(genre: GenreResponse?) -> [GenreEntity] {
        guard let genre = genre else { return [] }
        
        let genres: [GenreEntity] = genre.genres?.compactMap {
            GenreEntity(name: $0.name ?? "")
        } ?? []
        return genres
    }
}
