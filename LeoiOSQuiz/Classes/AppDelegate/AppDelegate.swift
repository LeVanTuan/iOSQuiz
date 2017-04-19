//
//  AppDelegate.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        checkLogIn()
        configureGoogleMaps()
        return true
    }
    
    func configureGoogleMaps() {
        GMSServices.provideAPIKey(kGoogleApiKey)
        GMSPlacesClient.provideAPIKey(kGoogleApiKey)
    }
    
    func checkLogIn() {
        if isLoggedIn() {
            setRootIsMainViewController()
        } else {
            setRootIsAuthenticationViewController()
        }
    }
    
    func setRootIsMainViewController() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            self.window?.rootViewController = storyBoard.instantiateViewController(withIdentifier: MainViewController.className) as! MainViewController
        }, completion: nil)
    }
    
    func setRootIsAuthenticationViewController() {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
            self.window?.rootViewController = storyBoard.instantiateViewController(withIdentifier: AuthenticationViewController.className) as! AuthenticationViewController
        }, completion: nil)
    }
    
    func isLoggedIn() -> Bool {
        return AppUserDefaults.authentication.isAccessTokenExist()
    }
}

