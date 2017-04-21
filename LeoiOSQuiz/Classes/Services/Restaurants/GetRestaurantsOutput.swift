//
//  GetRestaurantsOutput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class GetRestaurantsOutput: APIBaseOutput {
    var restaurants: [Restaurant]
    
    override init() {
        restaurants = [Restaurant]()
        super.init()
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        restaurants <- map["businesses"]
    }
    
}
