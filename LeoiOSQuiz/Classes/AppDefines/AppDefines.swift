//
//  AppDefines.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation

//MARK: - Device Key
let kUserDefaults = UserDefaults.standard

//MARK: - Google Api Key
let kGoogleApiKey = "AIzaSyA4m8zy3HNh2DYKbsCVIOGKnxusN7cjeJ0"

let kAuthentication = "kAuthentication"

enum AuthenKey: String {
    case accessToken = "access_token"
    case tokenType = "token_type"
    case expiresIn = "expires_in"
}

struct AppConfigures {
    static let bearer = "Bearer "
    static let currentToken = "abc"
    
    static let clientID = "q7M_efjwPJUL8bz2u6rnZw"
    static let clientSecret = "dv8sxsYAYJ7LTxeRFLDJZ1EGzB7vAqJEkZD25wvGT5m0FRR8nyuAfOWq5c9BLlCD"
}


class AppUserDefaults {
    class var authentication: Authentication {
        set (newValue) {
            let data = NSKeyedArchiver.archivedData(withRootObject: newValue)
            kUserDefaults.setValue(data, forKey: kAuthentication)
            kUserDefaults.synchronize()
        }
        get {
            if let authenData = kUserDefaults.object(forKey: kAuthentication) as? Data {
                if let authentication = NSKeyedUnarchiver.unarchiveObject(with: authenData) as? Authentication {
                    return authentication
                }
            }
            return Authentication()
        }
    }
    
    
}
