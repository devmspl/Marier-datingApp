//
//  ImagesCollectionCell.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import UIKit
import AlamofireImage

class ImagesCollectionCell: UICollectionViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func config(data: [UserGallery?]){
        for i in 0...data.count-1{
            if let image = data[i]?.image as? String{
                let url = URL(string: image)
                if url != nil{
                    self.cellImage.af.setImage(withURL: url!)
                }else{
                    //
                }
            }
        }
       
    }

}
