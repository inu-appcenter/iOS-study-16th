import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieDetailImg: UIImageView!
    @IBOutlet weak var movieDetailTitle: UILabel!
    @IBOutlet weak var movieDetailDescription: UILabel!
    
    var movie: Movie?
    
//    init(movie: MovieInfo) {
//        self.movieInfo = movie
//        super.init(nibName: nil, bundle: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(movie)
//        print(type(of: movieDetailImg))
//        print(type(of: movieDetailTitle))
//        print(type(of: movieDetailDescription))
//        if let movie = movie {
//            print("succeed")
////            print("\(movie.title) \(type(of: movie.title))")
////            print("\(movie.description) \(type(of: movie.description))")
////            print("\(movie.image) \(type(of: movie.image))")
//            movieDetailTitle.text = movie.title
//            movieDetailDescription.text = movie.description
//            movieDetailImg.image = UIImage(named: "\(movie.image).png")
//        }
//        else{
//            print("fail")
//            movieDetailTitle.text = "제목임당"
//            movieDetailDescription.text = "설명임당"
//        }
        guard let movie = movie else {
            print("fail")
            movieDetailTitle.text = "제목임당"
            movieDetailDescription.text = "설명임당"
            return
        }
//        guard let title = movie.title
        print("title: \(movie.title), description: \(movie.description), img: \(movie.image)")
//        print("succeed")
//        print(movieDetailTitle)
        movieDetailTitle.text = movie.title
        movieDetailDescription.text = movie.description
        movieDetailImg.image = UIImage(named: "\(movie.image).png")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
