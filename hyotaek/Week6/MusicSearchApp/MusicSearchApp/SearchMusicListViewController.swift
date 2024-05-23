import UIKit

class SearchMusicListViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var musicList = [MusicInfo]()
    let cellName = "MusicListCell"
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
        registerXib()
        setUpSearchController()
        Task {
            await setUpMusicList(searchTerm: "치즈")
        }
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: MusicListCell.identifier)
    }
    
    func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setUpSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.delegate = self
        
        navigationItem.title = "Music Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
    }
    
    func setUpMusicList(searchTerm: String) async {
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=\(searchTerm)") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let result = try JSONDecoder().decode(SearchResult.self, from: data)
            self.musicList = result.results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            print("에러 발생: \(error)")
        }
    }
}

extension SearchMusicListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            Task {
                await setUpMusicList(searchTerm: "치즈")
                isSearching = false
                collectionView.collectionViewLayout.invalidateLayout()
            }
            return
        }
        Task {
            await setUpMusicList(searchTerm: searchText)
            isSearching = true
            collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

extension SearchMusicListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicListCell.identifier, for: indexPath) as? MusicListCell, indexPath.row < musicList.count else {
            return UICollectionViewCell()
        }
        let targetCell = musicList[indexPath.row]
        cell.configure(with: targetCell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicList.isEmpty ? 0 : musicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isSearching {
            let itemsPerRow: CGFloat = 3
            let width = collectionView.frame.width / itemsPerRow
            return CGSize(width: width, height: width)
        } else {
            return CGSize(width: collectionView.frame.width, height: 140)
        }
    }
}

extension SearchMusicListViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        musicList.removeAll()
        isSearching = false
        searchBar.text = ""
        collectionView.reloadData()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
