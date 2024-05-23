//
//  SearchMusicDetailViewController.swift
//  MusicSearch
//
//  Created by 한현승 on 5/23/24.
//

import UIKit

class SearchResultsViewController: UIViewController {

    var musicData: [Music] = []
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        //self.view.bounds
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MusicImageCollectionViewCell.self, forCellWithReuseIdentifier: MusicImageCollectionViewCell.identifier)
          
        self.view.addSubview(collectionView)
        
        
        NSLayoutConstraint.activate([
                  collectionView.topAnchor.constraint(equalTo: view.topAnchor),
                  collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                  collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                  collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
              ])
    }
    
    func updateData(with musicData: [Music]){
        self.musicData = musicData
        self.collectionView.reloadData()
    }
    
    
}

extension SearchResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicImageCollectionViewCell.identifier, for: indexPath) as? MusicImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let music = musicData[indexPath.item]
        cell.configure(music: music)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.width - 2 ) / 3
        
        return CGSize(width: width , height: width)
        
    }
    
    
    
}
