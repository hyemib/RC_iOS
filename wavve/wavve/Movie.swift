
import Foundation

struct Movie: Codable {
    let results: [MovieResult]
}

struct MovieResult: Codable {
    let title: String
    let poster: String
    let overview: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case poster = "poster_path"
        case overview
        case date = "release_date"
    }
}


