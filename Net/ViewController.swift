//
//  ViewController.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 24/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nTable:UITableView!
    
    var dataList = [MoviesModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nTable.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/550?api_key=469821b988270d2366e546a380e03332"))){
            {data,req.error} in
            
            do{
                let result = JSONDecoder().decode(MoviesModel.self, from: data!)
                DispatchQueue.main.async {
                    self.dataList = MoviesModel.MoviesModel
                    self.nTable.reloadData()
                }
            }catch{
                
            }
        }.resume()
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.onBind(data: dataList(indexPath.row))
        return cell
    }
    
    
}
