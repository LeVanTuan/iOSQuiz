//
//  AuthenticationInput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import Alamofire

class AuthenticationInput: APIBaseInput {
    
    init() {
        let urlString = String(format:APIUrl.getAccessToken,AppConfigures.clientID,AppConfigures.clientSecret)
        super.init(urlString: urlString,
                   requestType: .post,
                   parameters: nil,
                   isTokenRequired: false)
    }
}
