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
    var rating: Float
    var imageUrl: String
    var url: String
    var reviewCount: Int
    var coordinates : Coordinate
    var id: String
    var categories: [Category]

    init() {
        self.id = ""
        self.name = ""
        self.rating = 0.0
        self.imageUrl = ""
        self.url = ""
        self.reviewCount = 0
        self.coordinates = Coordinate()
        self.categories = [Category]()
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        rating <- map["rating"]
        imageUrl <- map["image_url"]
        url <- map["url"]
        reviewCount <- map["review_count"]
        coordinates <- map["coordinates"]
        categories <- map["categories"]
    }
}
