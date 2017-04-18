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
        configureGoogleMaps()
        return true
    }
    
    func configureGoogleMaps() {
        GMSServices.provideAPIKey(kGoogleApiKey)
        GMSPlacesClient.provideAPIKey(kGoogleApiKey)
    }
}

