// ViewController입니당

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let movieList = Movie.data
    let cellHeight: CGFloat = 1
    let cellName = "MovieListCell"
    let cellReuseIdentifier = "movieCell"
    
    override func viewDidLoad() {    
        super.viewDidLoad()
        
        registerXib()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.rowHeight = UITableView.automaticDimension;
//        tableView.estimatedRowHeight = 130;
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieList.count
    }
        
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellHeight
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieListCell
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MovieListCell else { return UITableViewCell() }
        let target = movieList[indexPath.section]
        let movieImg = UIImage(named: "\(target.image).png")
        
        cell.movieThumbnail.image = movieImg
        cell.movieTitle.text = target.title
        cell.movieDescription.text = target.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movieList[indexPath.section]
        
//        selectedMovie.image = UIImage(named: "\(selectedMovie.image).png")
        
//        cell.movieThumbnail.image = movieImg
//        cell.movieTitle.text = target.title
//        cell.movieDescription.text = target.description
        
        
//        let detailVC = DetailViewController()
//        detailVC.movie = selectedMovie
//        navigationController?.pushViewController(detailVC, animated: true)
        
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier:"DetailViewController") as? DetailViewController else {
            return
        }
        detailVC.movie = selectedMovie
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

