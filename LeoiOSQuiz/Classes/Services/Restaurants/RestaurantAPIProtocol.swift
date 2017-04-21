//
//  RestaurantAPIProtocol.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import PromiseKit

protocol RestaurantAPIProtocol {
    func getResaturants(_ input: GetRestaurantsInput) -> Promise<GetRestaurantsOutput>
    func getReviewOfARestaurant(_ input: GetRestaurantReviewsInput) -> Promise<GetRestaurantReviewsOutput>
}
