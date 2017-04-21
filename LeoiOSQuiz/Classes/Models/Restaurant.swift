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
    
    var id: String
    var name: String
    var rating: Float
    var price: String
    var phone: String
    var imageUrl: String
    var url: String
    var reviewCount: Int
    var coordinates : Coordinate
    var categories: [Category]
    var location: Location
    var reviews: [Review]
    
    init() {
        self.id = ""
        self.name = ""
        self.rating = 0.0
        self.price = ""
        self.phone = ""
        self.imageUrl = ""
        self.url = ""
        self.reviewCount = 0
        self.coordinates = Coordinate()
        self.categories = [Category]()
        self.location = Location()
        self.reviews = [Review]()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        rating <- map["rating"]
        price <- map["price"]
        phone <- map["phone"]
        imageUrl <- map["image_url"]
        url <- map["url"]
        reviewCount <- map["review_count"]
        coordinates <- map["coordinates"]
        categories <- map["categories"]
        location <- map["location"]
    }
}
