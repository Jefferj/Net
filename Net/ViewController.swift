//
//  ViewController.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 24/08/22.
//

import UIKit
import Alamofire


class ViewController {
    
    @IBOutlet weak var nTable:UITableView!
    
    private var apiKey = "469821b988270d2366e546a380e03332"
    fileprivate var baseUrl = ""
    private let messageOfError = "I'm sorry, we couldn't do this"
    
    
    typealias moviesModelCallBack = (_ moviesModel: MoviesModel?, _ status: Bool, _ message: String) -> Void
        var moviesModelCallBack: moviesModelCallBack?
    
    init(baseUrl: String) {
            self.baseUrl = baseUrl
        }
    
    
    
    
    func getMoviesModelWith(movieId: String) {
           let url = "\(self.baseUrl)\(movieId)\(apiKey)"
           print("URL: \(url)")
           AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response {
               (responseData) in
               guard let data = responseData.data else {
                   self.moviesModelCallBack?(nil, false, self.messageOfError)
                   return
               }
               do {
                   let movieModel = try JSONDecoder().decode(MoviesModel.self, from: data)
                   print(movieModel)
                   
                   if movieModel.statusCode == nil {
                       self.moviesModelCallBack?(movieModel, true, "")
                   } else {
                       let errorMessage = movieModel.statusMessage ?? self.messageOfError
                       self.moviesModelCallBack?(nil, false, errorMessage)
                   }
               } catch {
                   self.moviesModelCallBack?(nil, false, error.localizedDescription)
                   print("ERROR DECODING: \(error.localizedDescription)")
               }
           }
       }
       
       func moviesModelCompletionHandler(callBack: @escaping moviesModelCallBack) {
           self.moviesModelCallBack = callBack
       }
       
   }
