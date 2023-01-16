//
//  LandingVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginWithFacebook(_ sender: UIButton){
        
    }
    @IBAction func loginWithGoogle(_ sender: UIButton){
        
    }
    @IBAction func loginWithApple(_ sender: UIButton){
        
    }
    @IBAction func loginWithNumber(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.pushVC(controller: vc)
    }
    @IBAction func signUp(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.pushVC(controller: vc)
    }


}
