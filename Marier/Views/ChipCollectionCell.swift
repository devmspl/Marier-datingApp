//
//  ChipCollectionCell.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import UIKit

class ChipCollectionCell: UICollectionViewCell {
    @IBOutlet weak var chipView: UIView!
    @IBOutlet weak var chiptext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(cellData: [OrientationAndInterestDataModel?]){
        chipView.layer.cornerRadius = 15
        chipView.layer.borderColor = UIColor.gray.cgColor
        chipView.layer.borderWidth = 1
        for i in 0...cellData.count-1{
            chiptext.text = cellData[i]?.type
        }
    }

}
