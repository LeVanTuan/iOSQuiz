//
//  Authentication.swift
//  LeoiOSQuiz
//
//  Created by NeoLap on 4/16/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Authentication: NSObject, Mappable, NSCoding {
    var accessToken: String
    var tokenType: String
    var expiresIn: Double
    var updateDate: Date
    
    override init() {
        self.accessToken = ""
        self.tokenType = ""
        self.expiresIn = 0
        updateDate = Date()
    }
    
    init(accessToken: String, tokenType: String, expresIn: Double) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expresIn
        self.updateDate = Date()
    }
    
    required public convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        accessToken <- map[AuthenKey.accessToken.rawValue]
        tokenType <- map[AuthenKey.tokenType.rawValue]
        expiresIn <- map[AuthenKey.expiresIn.rawValue]
    }

    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.accessToken, forKey: AuthenKey.accessToken.rawValue)
        aCoder.encode(self.tokenType, forKey: AuthenKey.tokenType.rawValue)
        aCoder.encode(self.expiresIn, forKey: AuthenKey.expiresIn.rawValue)
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        let accessToken = aDecoder.decodeObject(forKey: AuthenKey.accessToken.rawValue) as! String
        let tokenType = aDecoder.decodeObject(forKey: AuthenKey.tokenType.rawValue) as! String
        let expiresIn = aDecoder.decodeDouble(forKey: AuthenKey.expiresIn.rawValue)
        self.init(accessToken: accessToken, tokenType: tokenType, expresIn: expiresIn)
    }
    
    func isAccessTokenExist() -> Bool {
        let expiresTimeInterval = self.updateDate.timeIntervalSinceReferenceDate + self.expiresIn
        let currentTimeInterval = Date().timeIntervalSinceReferenceDate
        if currentTimeInterval <= expiresTimeInterval {
            return !self.accessToken.isEmpty
        }
        return false
    }
}
