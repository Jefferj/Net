//
//  MovieViewModel.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 18/09/22.
//

import Foundation

class MovieViewModel {
    
    var refreshData = {() -> () in}
    
    var results: [Movies] = [] {
        didSet {
            refreshData()
        }
    }
    
    func loadPopularMovies(page: Int) {
        ApiService().getPopularMovies(page: page, completionHandler: {
            movies in
            self.results.append(contentsOf: movies)
        })
    }
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(at section: Int) -> Int {
        return results.count
    }
    
    func item(at indexPath: IndexPath) -> Movies {
        return results[indexPath.row]
    }
    
}
