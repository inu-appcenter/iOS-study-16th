//
//  MusicImageCollectionViewCell.swift
//  MusicSearch
//
//  Created by 한현승 on 5/23/24.
//

import UIKit

final class MusicImageCollectionViewCell: UICollectionViewCell {
    
    let musicImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func configure(music: Music){
        Task{
            if let url = URL(string: music.artworkUrl100){
                let (data, _) = try await URLSession.shared.data(from: url)
                let image = UIImage(data: data)
                musicImage.image = image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(musicImage)
        
        NSLayoutConstraint.activate([
            musicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            musicImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            musicImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            musicImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension MusicImageCollectionViewCell {
    static var identifier: String{
        return String(describing: self)
    }
}
