//
//  RestaurantServices.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

class RestaurantServices: APIServices, RestaurantAPIProtocol {
    func getResaturants(_ input: GetRestaurantsInput) -> Promise<GetRestaurantsOutput> {
        return self.request(input)
    }
    
    func getReviewOfARestaurant(_ input: GetRestaurantReviewsInput) -> Promise<GetRestaurantReviewsOutput> {
        return self.request(input)
    }
}
