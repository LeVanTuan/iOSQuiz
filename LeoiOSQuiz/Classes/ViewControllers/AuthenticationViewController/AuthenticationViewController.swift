//
//  AuthenticationViewController.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/18/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

class AuthenticationViewController: UIViewController {

    let services = AuthenticationServices()
    
    var didAuthenticate: ((_ success: Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getToken()
    }
    
    func getToken() {
        firstly { () -> Promise<AuthenticationOutput> in
            let input = AuthenticationInput()
            return services.getAccessToken(input)
            }.then(execute: { [weak self] (output) -> Void in
                self?.saveDataAndDismiss(authen: output.authen)
            }).catch { [weak self] (error) in
                print(error)
                self?.didAuthenticate?(false)
        }
    }
    
    func saveDataAndDismiss(authen: Authentication) {
        print("Token: ",authen.accessToken)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        AppUserDefaults.authentication = authen
        appDelegate.setRootIsMainViewController()
    }
}
