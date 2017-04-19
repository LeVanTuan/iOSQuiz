
//
//  Location.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/19/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Location: Mappable {
    var address1: String
    var address2: String
    var address3: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
    
    init() {
        self.address1 = ""
        self.address2 = ""
        self.address3 = ""
        self.city = ""
        self.state = ""
        self.country = ""
        self.zipCode = ""
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        city <- map["city"]
        state <- map["state"]
        country <- map["country"]
        zipCode <- map["zip_code"]
    }
    
}
