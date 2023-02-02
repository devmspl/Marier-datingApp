//
//  ChatTableLeftCell.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class ChatTableLeftCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var messageTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.contentMode = .scaleAspectFill
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func cellConfig(config: getMessageModel){
        messageText.text = config.content
        messageTime.text = config.date
        
    }
}
