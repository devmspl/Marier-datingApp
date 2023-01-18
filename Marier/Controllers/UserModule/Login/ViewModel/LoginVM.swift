//
//  LoginVM.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import UIKit

protocol loginResponse{
    func getLoginResponse(loginResponse: LoginResponseModel)
}

class LoginVM: NSObject {
    
    ///
    var delegate: loginResponse?
    ///
    
    func loginApi(requestData: LoginModel,completion: @escaping(Bool,String)->()){
        
        let validationResult = LoginValidation().validate(loginRequest: requestData)
        
        if validationResult.success{
            let requestBody = ["phoneNumber":requestData.phoneNumber]
            ApiManager.shared.hitApis(requestUrl: ApiUrls.login, httpMethod: .post, requestBody: requestBody) { result, statusCode, isSuccess, error in
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
