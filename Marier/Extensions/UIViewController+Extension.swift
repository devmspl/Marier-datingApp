//
//  Subscription.swift
//  Marier
//
//  Created by MacBook M1 on 27/02/23.
//

import Foundation
import UIKit

extension UIViewController{
    //MARK: - subscriptionscreen
    
    func presentSubscriptionVC(){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "SuperlikeVC") as! SuperlikeVC
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
    ///
    ///
 //Show alert
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
      ///
        // showAlertWithOneAction
    func showAlertWithOneAction(alertTitle:String, message: String, action1Title:String, completion1: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action1Title, style: .default, handler: completion1))
        self.present(alert, animated: true, completion: nil)
    }
        ///
        //showAlertWithTwoActions
    func showAlertWithTwoActions(alertTitle:String, message: String, action1Title:String, action1Style: UIAlertAction.Style ,action2Title: String ,completion1: ((UIAlertAction) -> Void)? = nil,completion2 :((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: action1Title, style: action1Style, handler: completion1))
        alert.addAction(UIAlertAction(title: action2Title, style: .default, handler: completion2))
        self.present(alert, animated: true, completion: nil)
    }
    ///
    ///
    //push
     func pushVC(controller:UIViewController){
        self.navigationController?.pushViewController(controller, animated: true)
     }
    //pop
    func poptoViewController(){
       self.navigationController?.popViewController(animated: true)
    }
    //embeded
    func embed(_ viewController:UIViewController, inView view:UIView){
        self.addChild(viewController)
        viewController.view.frame = view.frame
        self.view.addSubview(viewController.view)
       viewController.didMove(toParent: self)
    }
}
