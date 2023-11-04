//
//  DataProcessor.swift
//  mandiri-ios
//
//  Created by Miftah Juanda Batubara on 03/11/23.
//

import Foundation

protocol ProcessingProtocol {
    func mapToGenreEntity(genre: GenreResponse?) -> [GenreEntity]
    func mapToDiscoverEntity(discover: DiscoverResponse?) -> DiscoverEntity
    func mapToDetailEntity(detail: DetailResponse?) -> DetailEntity
    func mapToReviewEntity(review: ReviewResponse?) -> ReviewEntity
    func mapToVideoEntity(video: VideoResponse?) -> VideoEntity
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
    
    func mapToDetailEntity(detail: DetailResponse?) -> DetailEntity {
        let genres = detail?.genres?.map{ $0.name ?? "" } ?? []
        let joinedGenre = genres.joined(separator: ", ")
        
        let detail = DetailEntity(id: detail?.id ?? 0,
                                  title: detail?.title ?? "",
                                  adult: detail?.adult ?? false,
                                  genres: joinedGenre + ".",
                                  voteAverage: String(format: "%.1f", detail?.voteAverage ?? 0.0)+"/10",
                                  voteCount: String(detail?.voteCount ?? 0).formatVoteNumber() + " Reviews",
                                  releaseDate: detail?.releaseDate ?? "",
                                  productionCountrie: detail?.productionCountries?.first?.iso3166_1 ?? " ",
                                  runtime: String(detail?.runtime ?? 0).calculateTime(),
                                  overview: detail?.overview ?? " ")
        return detail
    }
    
    func mapToReviewEntity(review: ReviewResponse?) -> ReviewEntity {
        let data = review?.results?.map{ res in
            return Reviews(author: res.author ?? "",
                           content: res.content ?? "",
                           avatarUrl: "\(NetworkConfig.shared.baseUrlPoster + (res.authorDetails?.avatarPath ?? ""))",
                           rating: Double(res.authorDetails?.rating ?? 0))
        } ?? []
        return ReviewEntity(id: review?.id ?? 0,
                            page: review?.page ?? 0,
                            reviews: data)
    }
    
    func mapToVideoEntity(video: VideoResponse?) -> VideoEntity {
        let result = video?.results?.flatMap{ res in
            var ress: [ResultVideo] = []
            if res.site == "YouTube" && res.type == "Trailer" {
                ress.append(res)
            }
            return ress
        }
        
        return VideoEntity(id: video?.id ?? 0,
                           type: result?.first?.type ?? "-",
                           site: result?.first?.site ?? "",
                           url: NetworkConfig.shared.baseUrlYoutube + (result?.first?.key ?? ""))
    }
}
