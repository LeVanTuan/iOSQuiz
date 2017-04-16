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
        let params: [String : Any] = [
            "grant_type" : "",
            "client_id" : AppConfigures.clientSecret,
            "client_secret" : AppConfigures.clientSecret
        ]
        super.init(urlString: APIUrl.getAccessToken,
                   requestType: .post,
                   parameters: params)
    }
}
