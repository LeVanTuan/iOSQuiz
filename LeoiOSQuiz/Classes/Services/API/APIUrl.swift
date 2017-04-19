//
//  APIUrl.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

struct APIUrl {
    static let endPoint = "https://api.yelp.com/v3/"
    
    //Get access token
    static let getAccessToken = "https://api.yelp.com/oauth2/token?grant_type=client_credentials&client_id=%@&client_secret=%@"
    
    //Get retaurants
    static let getRestaurants = endPoint + "businesses/search"
}
