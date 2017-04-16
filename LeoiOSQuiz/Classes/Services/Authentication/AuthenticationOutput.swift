//
//  AuthenticationOutput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class AuthenticationOutput: APIBaseOutput {
    var authen: Authentication
    
    private override init() {
        authen = Authentication()
        super.init()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        authen <- map
    }
}
