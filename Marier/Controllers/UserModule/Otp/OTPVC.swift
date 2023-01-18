//
//  OTPVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit
import OTPTextField

class OTPVC: UIViewController {
    
    

    @IBOutlet weak var otpView: UIView!
 
    @IBOutlet weak var resendBtn: UIButton!
    @IBOutlet weak var otpTextField: OTPTextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
//MARK: - private functions
    private lazy var viewModel: OtpVM = {
        return OtpVM()
    }()
    ///////////
    
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func resendTapped(_ sender: UIButton){
        
    }
    @IBAction func onContinueTap(_ sender: UIButton){
        
            viewModel.apiCall(otp: otpTextField.text!) { isSuccess, error in
                if isSuccess{
                    let vc = storyBoards.Main.instantiateViewController(withIdentifier: "SexualOrientationVC") as! SexualOrientationVC
                    self.pushVC(controller: vc)
                }else{
                    self.alert(message: error)
                }
            }
    }
}
