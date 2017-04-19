//
//  GetRestaurantsInput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

class GetRestaurantsInput: APIBaseInput {
    
    init (latitude: Double, longitude: Double) {
        let params: [String : Any] = [
            "term" : "delis",
            "latitude" : latitude,
            "longitude" : longitude
        ]
        super.init(urlString: APIUrl.getRestaurants,
                   requestType: .get,
                   parameters: params)
    }
    
}
