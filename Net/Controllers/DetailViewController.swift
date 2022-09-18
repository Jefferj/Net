//
//  DetailViewController.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 18/09/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
   
    var movie: Movies?
    let baseUrlImage = "https://image.tmdb.org/t/p/w300"
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDescription: UILabel!
    
    @IBOutlet weak var movieLanguage: UILabel!
    
    @IBOutlet weak var movieBackdrop: UIImageView!

    @IBOutlet weak var viewDetail: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie?.title
        movieDescription.text = movie?.overview
        movieLanguage.text = movie?.originalLanguage
        movieLanguage.layer.cornerRadius = 6
        movieLanguage.layer.masksToBounds = true
        viewDetail.layer.cornerRadius = 20
        viewDetail.layer.masksToBounds = true
        movieBackdrop.layer.cornerRadius = 17
        movieBackdrop.layer.masksToBounds = true
        movieBackdrop.image = nil
        movieBackdrop.kf.cancelDownloadTask()
        if let backdropPath = URL(string: baseUrlImage + movie!.backdropPath){
            movieBackdrop.kf.setImage(with: backdropPath)
    }
}
        @IBAction func backButton(_ sender: Any) {
            self.dismiss(animated: true, completion: nil)
        }
    
}
