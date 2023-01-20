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
    @IBOutlet weak var address: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - private functions
    private lazy var viewModel: SignUpVM = {
        return SignUpVM()
    }()

//MARK: - ibaction
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
        
        let request = SignUpModel(name: fullName.text ?? "", phoneNumber: phoneNumber.text ?? "", sex: gender.text ?? "", dob: dateOfBirth.text ?? "", address: address.text ?? "")
        
            viewModel.apiCall(requestData: request, completion: { isSuccess, error in
               if isSuccess{
                   let vc = storyBoards.Main.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
                   self.pushVC(controller: vc)
               }else{
                   self.alert(message: error)
               }
           })
        }
       
    }

