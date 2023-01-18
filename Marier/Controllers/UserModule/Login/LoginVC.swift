//
//  LoginVC.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var coutryCodeView: UIView!
    @IBOutlet weak var countryText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - private functions
    private lazy var viewModel: LoginVM = {
        LoginVM()
    }()
  
    
    //MARK: - actionButtons
    @IBAction func onContinueTap(_ sender: UIButton){
        let request = LoginModel(phoneNumber: numberField.text ?? "")
            viewModel.loginApi(requestData: request) { isSuccess, error in
                if isSuccess{
                    let vc = storyBoards.Main.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
                    self.pushVC(controller: vc)
                }else{
                    self.alert(message: error)
                }
            }
        }
    
    @IBAction func onBackTap(_ sender: UIButton){
        self.poptoViewController()
    }
    @IBAction func countryPick(_ sender: UIButton){
        
    }

}
