//
//  ViewController.swift
//  MusicSearch
//
//  Created by 한현승 on 5/22/24.
//

import UIKit

final class SearchMusicViewController: UIViewController {
    
    var musicData: [Music] = []
    var searchController = UISearchController(searchResultsController: nil)
    var resultsViewController: SearchResultsViewController!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // searchBar.delegate = self
        
        resultsViewController = SearchResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.title = "Music Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        Task{
            await fetchData(searchTerm: "jazz")
        }
        
      
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            
    }
}

    
    func fetchData(searchTerm: String?) async {
        let term: String
        if let searchTerm = searchTerm, !searchTerm.isEmpty {
            term = searchTerm
        }
        else {
            term = "jack+johnson"
        }
        
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(term)") else {return}
        print(url)
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


extension SearchMusicViewController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        
     
        print(text)
        Task {
            await fetchData(searchTerm: text)
            if let resultsVC = searchController.searchResultsController as? SearchResultsViewController {
                resultsVC.updateData(with: self.musicData)
            }
            
        }
          
        
//        if let layout = collectionView.collectionViewLayout as?  UICollectionViewFlowLayout{
//         
//            let width = (collectionView.frame.width - 3 ) /  3
//            print("keyword 변경 \(width)")
//            layout.itemSize = CGSize(width: width, height: 130)
//            
//            layout.invalidateLayout()
//        }
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
        
        return CGSize(width:  collectionView.frame.width , height: 130)
        
    }
    

}


extension MusicCollectionViewCell {
    static var identifier: String{
        return String(describing: self)
    }
}
