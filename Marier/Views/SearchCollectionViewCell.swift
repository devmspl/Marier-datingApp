//
//  SearchCollectionViewCell.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit
import AlamofireImage

class SearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    func config(cellData:LikeBy){
        let image = ""
        if image == cellData.avatar as? String && image != "http://18.189.74.89/Product/marier_nodejs/assets/images/"{
            let url = URL(string: image)
            if url != nil || url != URL(string: "http://18.189.74.89/Product/marier_nodejs/assets/images/"){
                cellImage.af.setImage(withURL: url!)
            }else{
                let url = Marier.getGalleryFirstImage(gallery: cellData.gallery)
                if url != nil{
                    cellImage.af.setImage(withURL: url!)
                }else{
                    //
                }
            }
        }else{
            let url = Marier.getGalleryFirstImage(gallery: cellData.gallery)
            if url != nil{
                cellImage.af.setImage(withURL: url!)
            }else{
                //
            }
        }
        userName.text = cellData.name
        address.text = cellData.sex
    }
    
}
