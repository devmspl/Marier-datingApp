//
//  SignUpVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func genderDropDown(_ sender: UIButton){
        
    }
    @IBAction func dateSelection(_ sender: UIButton){
        
    }
    @IBAction func loginWithFacebook(_ sender: UIButton){
        
    }
    @IBAction func loginWithGoogle(_ sender: UIButton){
        
    }
    @IBAction func loginWithApple(_ sender: UIButton){
        
    }
    @IBAction func signUp(_ sender: UIButton){
        let vc = storyBoards.Main.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
        self.pushVC(controller: vc)
    }
}
