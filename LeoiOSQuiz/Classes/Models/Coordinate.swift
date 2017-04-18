//
//  Coordinate.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/18/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Coordinate: Mappable {
    var latitude: Double
    var longtitude: Double
    
    init() {
        self.latitude = 0.0
        self.longtitude = 0.0
    }
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longtitude <- map["longtitude"]
    }
}
