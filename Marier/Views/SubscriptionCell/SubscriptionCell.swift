//
//  SubscriptionCell.swift
//  Marier
//
//  Created by MacBook M1 on 02/03/23.
//

import UIKit

class SubscriptionCell: UICollectionViewCell {

    
    @IBOutlet weak var subscriptionView: UIView!
    @IBOutlet weak var subscriptionTime: UILabel!
    @IBOutlet weak var subscriptionPrice: UILabel!
    @IBOutlet weak var subscriptionOffer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subscriptionView.layer.borderWidth = 1
        subscriptionView.layer.borderColor = UIColor(named: "buttonColor")?.cgColor
    }

}
