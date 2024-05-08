//
//  ViewController.swift
//  MoviceChart
//
//  Created by 한현승 on 5/7/24.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    let movieList = Movie.data
    let cellName = "MovieCell"
    let cellReuseIdentifier = "MovieCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Movies loaded: \(movieList.count)")
        registerXib()
        
        tableView!.delegate = self
        tableView.dataSource = self
        
       
   
    }

    // xib Cell 파일 등록
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: cellReuseIdentifier)
    }
  
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    // Section당 Row수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    // Section의 수
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieList.count
    }
    
    
    // 필수 요구 메서드 : 해당위치에 나타날 셀을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MovieCell
      
        let target = movieList[indexPath.section]
        cell.movieImage?.image = target.movieImage
        cell.movieTitle?.text = target.title
        cell.movieContent?.text = target.content
        cell.backgroundColor = UIColor.clear
        
        return cell
    }

      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "ItemDetailView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemDetailView"{
            if let destination = segue.destination as?
                DetailViewController {
                if let selectedIndex =
                    self.tableView.indexPathForSelectedRow?.section {
                        let selectMovie = movieList[selectedIndex]
                    destination._image = selectMovie.movieImage
                    destination._title = selectMovie.title
                    destination._content = selectMovie.content
                }
                
            }
        }
    }
}
