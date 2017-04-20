//
//  ReviewCell.swift
//  LeoiOSQuiz
//
//  Created by framgia on 4/20/17.
//  Copyright © 2017 Leo LE. All rights reserved.
//

import UIKit
import Cosmos
import AlamofireImage

class ReviewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var contentLabel: UILabel!
    
    var review: Review! {
        didSet {
            updateData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        configureFullSeparator()
        configureAvatar()
    }
    
    fileprivate func configureFullSeparator() {
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsets.zero
        layoutMargins = UIEdgeInsets.zero
    }
    
    fileprivate func configureAvatar() {
        avatar.layer.cornerRadius = avatar.frame.width / 2.0
        avatar.clipsToBounds = true
        avatar.layer.borderWidth = 1.0
        avatar.layer.borderColor = UIColor.white.cgColor
    }
    
    fileprivate func updateData() {
        if let avatarUrl = URL(string:review.user.imageUrl) {
            avatar.af_setImage(withURL: avatarUrl)
        } else {
            avatar.image = nil
        }
        nameLabel.text = review.user.name
        timeLabel.text = review.timeCreated
        ratingView.rating = review.rating
        contentLabel.text = review.text
    }
    
}
