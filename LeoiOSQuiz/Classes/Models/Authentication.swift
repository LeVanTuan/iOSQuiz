//
//  Authentication.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Authentication: Mappable {
    var accessToken: String
    var tokenType: String
    var expiresIn: Int
    
    init() {
        self.accessToken = ""
        self.tokenType = ""
        self.expiresIn = 0
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        tokenType <- map["token_type"]
        expiresIn <- map["expires_in"]
    }
}
