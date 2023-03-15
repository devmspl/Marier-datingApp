//
//  Container.swift
//  Marier
//
//  Created by MacBook M1 on 24/01/23.
//

import Foundation
import UIKit

struct Container{
    func addController(type: String,mainController:UIViewController,containerView:UIView){
        var vc = UIViewController()
        if type == "likes"{
             vc = storyBoards.Match.instantiateViewController(withIdentifier: "RequestTableVC") as! RequestTableVC
        }else{
             vc = storyBoards.Match.instantiateViewController(withIdentifier: "NearbyVC") as! NearbyVC
        }
        
        mainController.embed(vc, inView: containerView)
//        mainController.addChild(vc)
//        vc.view.frame = containerView.frame
//        mainController.view.addSubview(vc.view)
//        vc.didMove(toParent: mainController)
    }
}
