//
//  ChatOptionCell.swift
//  Marier
//
//  Created by MacBook M1 on 27/02/23.
//

import UIKit

class ChatOptionCell: UITableViewCell {

    @IBOutlet weak var optionText: UILabel!
    
    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
