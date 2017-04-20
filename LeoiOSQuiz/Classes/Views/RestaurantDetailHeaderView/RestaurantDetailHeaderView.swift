//
//  RestaurantDetailHeaderView.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/20/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import Cosmos

class RestaurantDetailHeaderView: UIView {

    //Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var restaurant: Restaurant! {
        didSet {
            updateRestaurantBaseInforIntoUI()
        }
    }
    
    
    
    class func initFromNib() -> RestaurantDetailHeaderView {
        return Bundle.main.loadNibNamed(RestaurantDetailHeaderView.className, owner: nil, options: nil)![0] as! RestaurantDetailHeaderView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func updateRestaurantBaseInforIntoUI() {
        if let url = URL(string: restaurant.imageUrl) {
            coverImageView.af_setImage(withURL: url)
        }
        nameLabel.text = restaurant.name
        rateLabel.text = String(restaurant.rating.numberWithOneDecimal)
        rateView.rating = Double(restaurant.rating)
        addressLabel.text = restaurant.location.fullAddress()
        phoneLabel.text = restaurant.phone
    }
    
    func updateReviews(count: Int) {
        reviewLabel.text = String(format: kStringNumberReviews, count)
    }
}
