//
//  LoginResource.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct LoginResource{
    
    func loginUser(loginRequest: LoginModel,completion:@escaping(_ result: LoginResponseModel?)->Void){
        
        let requestBody = ["phoneNumber":loginRequest.phoneNumber]
        ApiManager.shared.hitApis(requestUrl: ApiUrls.login, httpMethod: .post, requestBody: requestBody) { result, statusCode, isSuccess, error in
            if isSuccess{
                let data = result["data"] as! [String:Any]
                let token = data["token"] as! String
                UserDefaults.standard.setValue(token, forKey: "token")
//                completion(isSuccess,"")
            }else{
//                completion(isSuccess,error)
            }
        }

        
    }
    
}
