
import Foundation

struct TV: Codable {
    let results: [TVResult]
}

struct TVResult: Codable {
    let name: String
    let poster: String
    let overview: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case poster = "poster_path"
        case overview
        case date = "first_air_date"
    }
}
