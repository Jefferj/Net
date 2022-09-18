//
//  MainViewController.swift
//  Net
//
//  Created by Jefferson Naranjo rodríguez on 18/09/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func button(_ sender: Any) {
        if textField.text!.contains("@") && textField.text!.contains(".com"){
            //presentar la otra vista
            presentMovies()
        } else {
            verifyEmail()
        }
    }
    
    func verifyEmail(){
        let alert = UIAlertController(title: "Email incorrecto", message: "Por favor ingrese un email válido, por ejemplo pedrogomez@gmail.com.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reintentar", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func presentMovies(){
        let moviesViewController = MoviesViewController(nibName: "MoviesViewController", bundle: nil)
        moviesViewController.modalPresentationStyle = .overFullScreen //mostrar pantalla completa
        self.present(moviesViewController, animated: true)
    }
}

