//
//  ChatTableCell.swift
//  Marier
//
//  Created by MacBook M1 on 05/01/23.
//

import UIKit

class ChatTableCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastMessage: UILabel!
    @IBOutlet weak var newMessageCount: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = userImage.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func cellConfig(data: GetChatUserModel){
        name.text = data.user?.name
        lastMessage.text = data.messages?.lastMessage?.content
        let messageCount = data.messages?.newMessage?.count
        if messageCount != nil{
            newMessageCount.setTitle("\(messageCount ?? 0)", for: .normal)
            newMessageCount.isHidden = true
        }else{
            newMessageCount.isHidden = true
        }
            if let image = data.user?.avatar as? String{
            userImage.setImage(imageStr: image)
            }else{
                userImage.image = UIImage(named: "profileActive")
            }
       
    }
    
}
