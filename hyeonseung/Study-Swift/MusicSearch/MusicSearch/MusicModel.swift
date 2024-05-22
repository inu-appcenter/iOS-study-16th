//
//  MusicModel.swift
//  MusicSearch
//
//  Created by 한현승 on 5/22/24.
//

import Foundation


protocol MusicModelProtocol {
    func musicsRetrieved(musics: [Music])
}

class MusicModel{

    var delegate: MusicModelProtocol?
    
    func getMusicInfo() {
        
        let url = "https://itunes.apple.com/search?media=music&term={searchTerm}"
        
        delegate?.musicsRetrieved(musics: [Music])
    }
}
