//
//  LoginVM.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import UIKit
import ADCountryPicker

class LoginVM: NSObject {
    
    var countryPicked = ""
    var picker = ADCountryPicker()
    
    func loginApi(requestData: LoginModel,completion: @escaping(Bool,String)->()){
        
        let validationResult = LoginValidation().validate(loginRequest: requestData)
        
        if validationResult.success{
            ApiManager.shared.hitApis(requestUrl: ApiUrls.login, httpMethod: .post, requestBody: requestData) { result, statusCode, isSuccess, error in
                if isSuccess{
                    let data = result["data"] as! [String:Any]
                    let token = data["token"] as! String
                    UserDefaults.standard.setValue(token, forKey: "token")
                    completion(isSuccess,"")
                }else{
                    completion(false,error)
                }
            }
        }else{
            completion(false,validationResult.error)
        }
    }    
}

extension LoginVM: ADCountryPickerDelegate{
    func pickCountry(View:UIViewController,label: UILabel){
        picker.delegate = self
        View.present(picker, animated: true)
        picker.didSelectCountryClosure = { [self] name, code in
            let dialCode = picker.getDialCode(countryCode: code)
            label.text = "\(code) \(dialCode ?? "+91")"
            picker.dismiss(animated: true)
            
        }
    }
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print("hcvg")
    }
    
   
}
