//
//  OTPVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class OTPVC: UIViewController {

    @IBOutlet weak var otpView: UIView!
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var textField1: UIView!
    @IBOutlet weak var textField2: UIView!
    @IBOutlet weak var textField3: UIView!
    @IBOutlet weak var textField4: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func resendTapped(_ sender: UIButton){
        
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "SexualOrientationVC") as! SexualOrientationVC
        self.pushVC(controller: vc)
    }
}
