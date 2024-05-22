//
//  MusicCollectionViewCell.swift
//  MusicSearch
//
//  Created by 한현승 on 5/22/24.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {

    @IBOutlet var musicImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    
    func configure(music: Music){
        self.title.text = music.trackName
        self.artist.text = music.artistName
        self.collectionTitle.text = music.collectionName
        
        let outputDateFormat = DateFormatter()
        outputDateFormat.dateFormat = "yyyy-MM-dd"
        
        let inputDateFormat = DateFormatter()
        inputDateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = inputDateFormat.date(from: music.releaseDate){
            self.releaseDate.text = outputDateFormat.string(from: date)
        }else{
            self.releaseDate.text = music.releaseDate
        }
        
        Task{
            if let url = URL(string: music.artworkUrl100){
                let (data, _) = try await URLSession.shared.data(from: url)
                let image = UIImage(data: data)
                musicImage.image = image
            }
        }
        
    }
    
}

extension MusicCollectionViewCell {
    static var identifier: String{
        return String(describing: self)
    }
}
