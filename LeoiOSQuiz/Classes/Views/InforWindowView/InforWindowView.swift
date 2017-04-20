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
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
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
        activityView.hidesWhenStopped = true
    }
    
    fileprivate func configureRatingView() {
        ratingView.settings.minTouchRating = 0
        ratingView.settings.fillMode = .precise
    }
    
    fileprivate func updateUI() {
        if let downloadURL = URL(string: restaurant.imageUrl) {
            handleActivityIndicatorView(start: true)
            imageView.af_setImage(withURL: downloadURL,
                                  placeholderImage: nil,
                                  filter: nil,
                                  progress: nil,
                                  progressQueue: DispatchQueue.global(),
                                  imageTransition: UIImageView.ImageTransition.curlDown(1.0),
                                  runImageTransitionIfCached: true, completion: { [weak self] (image) in
                self?.handleActivityIndicatorView(start: false)
            })
        }
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.location.fullAddress()
        ratingLabel.text = String(restaurant.rating.numberWithOneDecimal)
        ratingView.rating = Double(restaurant.rating)
    }
    
    func handleActivityIndicatorView(start: Bool) {
        if start {
            activityView.startAnimating()
        } else {
            activityView.stopAnimating()
        }
    }
}
