//
//  InforWindowView.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/17/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import AlamofireImage
import SnapKit
import Cosmos

class InforWindowView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var restaurant: Restaurant! {
        didSet {
            updateUI()
        }
    }
    
    class func initFromNib() -> InforWindowView {
        return Bundle.main.loadNibNamed(InforWindowView.className, owner: nil, options: nil)![0] as! InforWindowView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureRatingView()
    }
    
    fileprivate func configureRatingView() {
        ratingView.settings.minTouchRating = 0
        ratingView.settings.fillMode = .precise
    }
    
    fileprivate func updateUI() {
        if let downloadURL = URL(string: restaurant.icon) {
            imageView.af_setImage(withURL: downloadURL)
        }
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        ratingLabel.text = String(restaurant.rating.numberWithOneDecimal)
        reviewLabel.text = String(format: kStringNumberReviews, restaurant.reviews.count)
        ratingView.rating = Double(restaurant.rating)
    }
    
}
