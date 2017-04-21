//
//  GetRestaurantReviewsInput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

class GetRestaurantReviewsInput: APIBaseInput {
    
    init (restaurantID: String) {
        let uslString = String(format: APIUrl.getRestaurantReviews, restaurantID)
        super.init(urlString: uslString,
                   requestType: .get,
                   parameters: nil)
    }
}
