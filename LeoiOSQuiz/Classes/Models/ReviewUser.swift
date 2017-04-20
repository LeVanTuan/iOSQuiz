//
//  ReviewUser.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/20/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class ReviewUser: Mappable {
    
    var imageUrl: String
    var name: String
    
    init() {
        self.imageUrl = ""
        self.name = ""
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        imageUrl <- map["image_url"]
        name <- map["name"]
    }
}
