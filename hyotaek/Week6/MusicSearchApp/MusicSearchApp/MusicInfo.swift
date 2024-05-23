import Foundation

struct SearchResult: Codable {
    let results: [MusicInfo]
}

struct MusicInfo: Codable {
    let artistName: String
    let collectionName: String?
    let trackName: String
    let artworkUrl100: String
    let releaseDate: String
}
