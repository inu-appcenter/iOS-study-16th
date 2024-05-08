//
//  MovieDetailViewController.swift
//  MoviceChart
//
//  Created by 한현승 on 5/9/24.
//

import Foundation
import UIKit

class DetailViewController: UIViewController{
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieContent: UILabel!
    
    var _image: UIImage?
    var _title: String?
    var _content: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        movieImage.image = _image
        movieTitle.text = _title
        movieContent.text = _content
    }
}

