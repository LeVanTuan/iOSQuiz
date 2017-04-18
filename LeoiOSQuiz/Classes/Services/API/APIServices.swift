//
//  APIServices.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//


import Foundation
import Alamofire
import ObjectMapper
import PromiseKit

class APIServices {
    func request<T: Mappable>(_ input: APIBaseInput) -> Promise<T> {
        var header = input.headers
        
        if input.isTokenRequired {
            header["Authorization"] = AppUserDefaults.authentication.tokenType + " " + AppUserDefaults.authentication.accessToken
        }
        
        return Promise { fulfill, reject in
            Alamofire.request(input.urlString,
                              method: input.requestType,
                              parameters: input.parameters,
                              encoding: input.encoding,
                              headers: input.headers)
            .validate(statusCode: 200..<600)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    if let statusCode = response.response?.statusCode {
                        switch statusCode {
                        case 200:
                            guard let data = value as? [String: Any], let t = T(JSON: data) else {
                                reject(ResponseError.invalidData)
                                return
                            }
                            fulfill(t)
                        case 401:
                            reject(ResponseError.unauthorized)
                        default:
                            reject(ResponseError.unknown(statusCode: statusCode))
                        }
                    }
                case .failure(let error):
                    reject(error)
                }
            }
        
        }
    }
}
