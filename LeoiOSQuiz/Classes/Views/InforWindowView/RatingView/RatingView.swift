//
//  RatingView.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/17/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit

class RatingView: UIView {
    
    @IBOutlet var starImageViews: [UIImageView]!
    
    let starColor = UIColor.orange
    let defaultColor = UIColor.lightGray
    
    var rating: Float = 4.567658 {
        didSet {
            layoutIfNeeded()
            updateColorStars()
        }
    }
    
    class func initFromNib() -> RatingView {
        return Bundle.main.loadNibNamed(RatingView.className, owner: nil, options: nil)![0] as! RatingView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateColorStars() {
        resetColors()
        let rounded = rating.numberWithOneDecimal //number is x.#
        let intpart = Int(rounded)
        let decpart = rounded - Float(intpart)
        //int part
        updateColorWithIntPart(int: intpart)
        updateColorWithDecimalPart(decimal: CGFloat(decpart), atIndex: intpart)
        print(rounded)
    }
    
    func updateColorWithIntPart(int: Int) {
        for i in 0..<int {
            starImageViews[i].image = starImageViews[i].image?.withRenderingMode(.alwaysTemplate)
            starImageViews[i].tintColor = starColor
        }
    }
    
    func updateColorWithDecimalPart(decimal: CGFloat, atIndex index: Int) {
    }
    
    func resetColors() {
        for i in 0..<starImageViews.count {
            starImageViews[i].image = starImageViews[i].image?.withRenderingMode(.alwaysTemplate)
            starImageViews[i].tintColor = defaultColor
            starImageViews[i].layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        }
    }
}
