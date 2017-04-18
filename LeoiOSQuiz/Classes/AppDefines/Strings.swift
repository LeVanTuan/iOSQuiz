//
//  Strings.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

let kStringUserLocationTitle = "My Location"

//reviews
let kStringNumberReviews = "%d Reviews"

struct AlertVC {
    enum AlertButtonTitle: String {
        case ok = "OK"
        case cancel = "Cancel"
    }
    
    enum AlertTitle: String {
        case error = "Error"
    }
    
    enum AlertMessage: String {
        case authenFail = "Authenticate failed"
    }
}
