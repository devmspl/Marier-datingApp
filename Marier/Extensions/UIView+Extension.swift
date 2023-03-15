//
//  UIView+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 28/02/23.
//

import Foundation
import UIKit

class ShadowView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    func setUp(){
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
    }
    
}

extension UIView{
    func setBorder(color: UIColor){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 20
    }
    
    func tilt(degree: CGFloat){
        let angle = CGFloat.pi / degree
        let transform = CGAffineTransform(rotationAngle: angle)
        self.transform = transform
    }
}


