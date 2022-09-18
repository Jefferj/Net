//
//  MoviesModel.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 24/08/22.
//
import Foundation

struct Movies: Codable {
    let title: String?
    var imageUrl: String?
    let overview: String?
    let year: String?
    let originalLanguage: String?
    let popularity: Double?
    let voteAverage: Double?
    let backdropPath: String
    
    private enum CodingKeys: String, CodingKey {
        case title, overview, popularity
        case year = "release_date"
        case imageUrl = "poster_path"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case backdropPath = "backdrop_path"
    }
  
    
}

struct MoviesPage: Codable {
    let results: [Movies]
}
