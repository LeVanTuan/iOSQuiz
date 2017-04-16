//
//  APIBaseInput.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import Alamofire

class APIBaseInput {
    let headers = [
        "Content-Type" : "application/json; charset=utf-8",
        "Accept" : "application/json"
    ]
    
    let urlString: String
    let requestType: HTTPMethod
    let parameters: [String: Any]?
    var encoding: ParameterEncoding
    let isTokenRequired: Bool
    
    init(urlString: String, requestType: HTTPMethod, parameters: [String: Any]?, isTokenRequired: Bool = true) {
        self.urlString = urlString
        self.requestType = requestType
        self.parameters = parameters
        self.encoding = requestType == .get ? URLEncoding.default : JSONEncoding.default
        self.isTokenRequired = isTokenRequired
    }
}
