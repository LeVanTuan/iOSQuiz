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

class InforWindowView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingContainer: UIView!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var ratingView: RatingView!
    
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
        initRatingView()
    }
    
    func initRatingView() {
        if ratingView == nil {
            let ratingView = RatingView.initFromNib()
            ratingView.translatesAutoresizingMaskIntoConstraints = false
            ratingContainer.addSubview(ratingView)
            ratingView.snp.makeConstraints({ (maker) in
                maker.top.bottom.leading.trailing.equalTo(0)
            })
            self.ratingView = ratingView
        }
    }
    
    fileprivate func updateUI() {
        if let downloadURL = URL(string: restaurant.icon) {
            imageView.af_setImage(withURL: downloadURL)
        }
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        ratingLabel.text = String(restaurant.rating.numberWithOneDecimal)
        reviewLabel.text = String(format: kStringNumberReviews, restaurant.reviews.count)
        ratingView.rating = restaurant.rating
    }
    
}
