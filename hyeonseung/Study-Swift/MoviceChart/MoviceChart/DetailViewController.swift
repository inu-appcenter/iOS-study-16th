//
//  MovieDetailViewController.swift
//  MoviceChart
//
//  Created by 한현승 on 5/9/24.
//

import Foundation
import UIKit

struct MovieInfo {
    var selectImage: UIImage?
    var selectTitle: String?
    var selectContent: String?
}

final class DetailViewController: UIViewController{
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieContent: UILabel!
    
    var movieInfo: MovieInfo?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let info = movieInfo {
            movieImage.image = info.selectImage
            movieTitle.text = info.selectTitle
            movieContent.text = info.selectContent
        }
    }
}

