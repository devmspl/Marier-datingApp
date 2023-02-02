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
        let otpModel = OtpRequestModel(otp: otpTextField.text ?? "")
        viewModel.apiCall(otp: otpModel) { isSuccess,error in
                if isSuccess{
                    Navigation().getUserDataAndNavigate { isSuccess, navigation, error in
                        if isSuccess{
                            UIApplication.shared.keyWindow?.rootViewController = navigation
                            UIApplication.shared.keyWindow?.makeKeyAndVisible()
                        }else{
                            self.alert(message: error)
                        }
                    }
                }else{
                    self.alert(message: error)
                }
            }
    }
}
