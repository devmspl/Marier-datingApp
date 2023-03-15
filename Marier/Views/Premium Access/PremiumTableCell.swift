//
//  PremiumTableCell.swift
//  Marier
//
//  Created by MacBook M1 on 21/02/23.
//

import UIKit

class PremiumTableCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cellView.layer.borderColor = UIColor.gray.cgColor
        cellView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
