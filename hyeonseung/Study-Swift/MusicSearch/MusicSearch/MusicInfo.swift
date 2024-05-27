//
//  MusicInfo.swift
//  MusicSearch
//
//  Created by 한현승 on 5/22/24.
//

import Foundation


// Swift <-> JSON
struct MusicInfo: Codable {
    var resultCount: Int
    var results: [Music]
}


struct Music: Codable {
    var artworkUrl60: String
    var artworkUrl100: String
    var trackName: String
    var artistName: String
    var collectionName: String
    var releaseDate: String
}
