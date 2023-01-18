//
//  ChipCollectionCell.swift
//  Marier
//
//  Created by MacBook M1 on 16/01/23.
//

import UIKit

class ChipCollectionCell: UICollectionViewCell {

    @IBOutlet weak var chipView: UIView!
    @IBOutlet weak var chiptext: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func toggleSelected ()
       {
        if (isSelected){
            backgroundColor = .red
           }else {
            backgroundColor = .white
           }
       }
}
