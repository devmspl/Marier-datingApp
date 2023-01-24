//
//  NearbyTableCell.swift
//  Marier
//
//  Created by MacBook M1 on 05/01/23.
//

import UIKit

class NearbyTableCell: UITableViewCell {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func cellConfig(data: RandomListModel){
        name.text = data.name
//        address = data.a
    }
    
}
