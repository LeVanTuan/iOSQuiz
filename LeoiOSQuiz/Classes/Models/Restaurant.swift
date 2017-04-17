//
//  Restaurant.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/17/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Restaurant: Mappable {
    var name: String
    var address: String
    var rating: Float
    var icon: String
    var reviews: [Any]
    
    init() {
        self.name = ""
        self.address = ""
        self.rating = 0.0
        self.icon = ""
        self.reviews = []
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        address <- map["address"]
        rating <- map["rating"]
        icon <- map["icon"]
        reviews <- map["reviews"]
    }
    
    class func testRestaurant() -> Restaurant {
        let restaurant = Restaurant()
        restaurant.name = "Bean Mother restaurant"
        restaurant.address = "255 Hùng Vương, Đà Nẵng, Việt Nam"
        restaurant.rating = 3.7
        restaurant.icon = "https://www.w3schools.com/css/paris.jpg"
        restaurant.reviews = []
        return restaurant
    }
    
}
