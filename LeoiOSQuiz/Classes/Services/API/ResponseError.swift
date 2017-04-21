//
//  ResponseError.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/15/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

enum ResponseError: Error {
    case noStatusCode
    case unauthorized // 401
    case unknown(statusCode: Int)
    case invalidData
}
