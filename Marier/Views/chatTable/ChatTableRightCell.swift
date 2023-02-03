//
//  ChatTableRightCell.swift
//  Marier
//
//  Created by MacBook M1 on 05/01/23.
//

import UIKit

class ChatTableRightCell: UITableViewCell {

    
    @IBOutlet weak var timeHeight: NSLayoutConstraint!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func cellConfig(data:getMessageModel){
        msgLabel.text = data.content
        timeLabel.isHidden = true
        if timeLabel.isHidden{
            timeHeight.constant = 0
        }
        timeLabel.text = messagesTime(dateTo: data.date ?? "")
    }
    
}
