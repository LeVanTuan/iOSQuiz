//
//  UIViewControllerExtension.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/18/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PKHUD

extension UIViewController {
    func showLoading() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideLoading() {
        HUD.hide(animated: true)
    }
    
    func showAlert(message: String) {
        showAlert(message: message, andTitle: "")
    }
    
    func showAlert(message: String, andTitle title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        
        self.present(alert, animated: true, completion: nil)
    }
}
