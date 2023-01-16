//
//  AddInterestVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class AddInterestVC: UIViewController {

    @IBOutlet weak var interestView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "AddImagesVC") as! AddImagesVC
        self.pushVC(controller: vc)
    }

}
