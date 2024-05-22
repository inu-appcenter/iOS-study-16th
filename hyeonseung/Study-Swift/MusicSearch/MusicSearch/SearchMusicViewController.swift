//
//  ViewController.swift
//  MusicSearch
//
//  Created by 한현승 on 5/22/24.
//

import UIKit

class SearchMusicViewController: UIViewController {
   
    var musicData: [Music] = []
    
    var searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        collectionView.dataSource = self
        collectionView.delegate = self
       // searchBar.delegate = self
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.title = "Music Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
       
        Task{
            await fetchData(searchTerm: nil)
        }
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        }
            
    }

    
    func fetchData(searchTerm: String?) async {
        let term: String
        if let searchTerm = searchTerm {
            term = searchTerm
        }
        else {
            term = "jack"
        }
        
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(term)") else {return}
        
        do {
            let( data, _) = try await URLSession.shared.data(from: url)
            let musicInfo = try JSONDecoder().decode(MusicInfo.self, from: data)
            self.musicData = musicInfo.results
        }catch {
            print("error >> \(error)")
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}


extension SearchMusicViewController:  UISearchBarDelegate, UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
      
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            if text.isEmpty {
                layout.itemSize = CGSize(width: collectionView.frame.width, height: 130)
            }else {
            
                let itemsPerRow: CGFloat = 3
                let totalSpacing = layout.minimumInteritemSpacing * (itemsPerRow - 1) + layout.sectionInset.left + layout.sectionInset.right
                let width = (collectionView.frame.width - totalSpacing) / itemsPerRow
              
                layout.itemSize = CGSize(width: width, height: width)
            }
           
            layout.invalidateLayout()
        }
        
        
        Task {
            await fetchData(searchTerm:text)
            // UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        
        }
       
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
}

    
    
extension SearchMusicViewController: UICollectionViewDataSource,  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // 어떻게 표현할건지 -> Cell 사용
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath) as? MusicCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let music = musicData[indexPath.item]
        cell.configure(music: music)
        return cell
    }
    
    // 몇개의 데이터가 들어오는지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return musicData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: 130)
        
        
    }
}
