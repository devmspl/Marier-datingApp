//
//  UIImageView+extension.swift
//  Marier
//
//  Created by MacBook M1 on 31/01/23.
//

import Foundation
import AlamofireImage

extension UIImageView{
    func setImage(imageStr:String){
        let url = URL(string: imageStr)
        if url != nil{
            self.af.setImage(withURL: url!)
        }else{
            //
        }
    }
}
