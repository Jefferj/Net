//
//  MoviesViewController.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 18/09/22.
//

import Foundation
import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var viewModel = MovieViewModel()
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "moviecell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        configureActivity()
        viewModel.loadPopularMovies(page: page)
        bind()
        
    }
    
    func configureActivity(){
        activity.isHidden = false
        activity.startAnimating()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }
}
    
// TableView
extension MoviesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(at: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell") as! MovieTableViewCell
        let result = viewModel.item(at: indexPath)
        cell.configure(for: result)
        return cell

    }
}

extension MoviesViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedResults = viewModel.results[indexPath.row]
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.movie = selectedResults
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
