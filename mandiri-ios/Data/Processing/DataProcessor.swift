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
            GenreEntity(id: $0.id ?? 0, name: $0.name ?? "")
        } ?? []
        return genres
    }
    
    func mapToDiscoverEntity(discover: DiscoverResponse?) -> DiscoverEntity {
        let resultMap = discover?.results?.map{ res in
            return Discover(id: res.id ?? 0,
                            adult: res.adult ?? false,
                            title: res.title ?? "",
                            releaseDate: res.releaseDate?.convertDateString() ?? "",
                            voteAverage: String(res.voteAverage ?? 0.0),
                            posterUrl: NetworkConfig.shared.baseUrlPoster + (res.posterPath ?? ""))
        } ?? []
        
        let discover = DiscoverEntity(page: discover?.page ?? 0,
                                      discover: resultMap,
                                      totalPages: discover?.totalPages ?? 0)
        return discover
    }
}
