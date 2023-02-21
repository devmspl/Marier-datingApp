//
//  GalleryImage.swift
//  Marier
//
//  Created by MacBook M1 on 04/02/23.
//

import Foundation
import UIKit

class GalleryImage: UICollectionViewCell{
    @IBOutlet weak var image: UIImageView!
    
    func cellConfig(data: UserGallery){
        image.setImage(imageStr: data.image)
    }
}
