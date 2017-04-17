//
//  FloatExtension.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/17/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

extension Float {
    var numberWithOneDecimal: Float {
       return roundf(self * 10.0) / 10.0
    }
}
