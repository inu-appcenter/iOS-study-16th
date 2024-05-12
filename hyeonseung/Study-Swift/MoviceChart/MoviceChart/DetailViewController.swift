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
    
    var selectImage: UIImage?
    var selectTitle: String?
    var selectContent: String?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        movieImage.image = selectImage
        movieTitle.text = selectTitle
        movieContent.text = selectContent
    }
}

