//
//  BaseController.swift
//  MarvelTestApp
//
//  Created by Sergio Ivan Vélez Valdés on 19/04/21.
//

import Foundation
import UIKit

class BaseController: UIViewController {
    
    var spinner  : UIView = UIView()
    
    func showAlertError(error: Error) {
        // we sent error anyway because in a future, we can handle this error and show a custom message, with a factory pattern for example.
        let alert = UIAlertController(title: "Oops", message: "We couldn't find information to you, please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    public func showLoading(){
        DispatchQueue.main.async {
            self.spinner = self.view.displaySpinner()
        }
    }
    
    public func hideLoading(){
        DispatchQueue.main.async {
            self.view.removeSpinner(spinner: self.spinner)
        }
    }
}
