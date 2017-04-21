//
//  Category.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/18/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import ObjectMapper

class Category: Mappable {
    var alias: String
    var title: String
    
    init() {
        self.alias = ""
        self.title = ""
    }
 
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        alias <- map["alias"]
        title <- map["title"]
    }
}
