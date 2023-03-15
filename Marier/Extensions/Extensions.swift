//
//  Extensions.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation
import UIKit


//MARK: - uiviewcontroller extension //////



///
///
///
extension UIView {
    enum dashedOrientation {
        case horizontal
        case vertical
    }
 ///////////
    func makeDashedBorderLine(color: UIColor, strokeLength: NSNumber, gapLength: NSNumber, width: CGFloat, orientation: dashedOrientation) {
        let path = CGMutablePath()
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineDashPattern = [strokeLength, gapLength]
        if orientation == .vertical {
            path.addLines(between: [CGPoint(x: bounds.midX, y: bounds.minY),
                                    CGPoint(x: bounds.midX, y: bounds.maxY)])
        } else if orientation == .horizontal {
            path.addLines(between: [CGPoint(x: bounds.minX, y: bounds.midY),
                                    CGPoint(x: bounds.maxX, y: bounds.midY)])
        }
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
/////
    func setBottomCurve(){
        let offset = CGFloat(self.frame.size.height/0.8)
                   let bounds = self.bounds

        let rectBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y  , width:  bounds.size.width, height: bounds.size.height / 2)
                   let rectPath = UIBezierPath(rect: rectBounds)
                   let ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
                   let ovalPath = UIBezierPath(ovalIn: ovalBounds)
                   rectPath.append(ovalPath)
                   let maskLayer = CAShapeLayer.init()
                   maskLayer.frame = bounds
                   maskLayer.path = rectPath.cgPath
                   self.layer.mask = maskLayer
               }
   
}



