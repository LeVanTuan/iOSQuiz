//
//  Review.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/20/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Review: Mappable {
    
    var url: String
    var text: String
    var user: ReviewUser
    var rating: Double
    var timeCreated: String

    init() {
        self.url = ""
        self.text = ""
        self.user = ReviewUser()
        self.rating = 0.0
        self.timeCreated = ""
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        text <- map["text"]
        user <- map["user"]
        rating <- map["rating"]
        timeCreated <- map["time_created"]
    }
}
