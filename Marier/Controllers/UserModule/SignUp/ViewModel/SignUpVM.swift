//
//  SignUpVM.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import UIKit

class SignUpVM: NSObject {

        
    //MARK: - api call
    func apiCall(requestData:SignUpModel,completion: @escaping(Bool,String)->()){
        
        let validationResult = SignUpValidation().validate(request: requestData)
        
        if validationResult.success{
            let parameters: [String:Any] = ["name":requestData.name,
                                            "dob":requestData.dob,
                                            "phoneNumber":requestData.phoneNumber,
                                            "sex":requestData.sex.lowercased()]
//            ApicallStart
            ApiManager.shared.hitApis(requestUrl: ApiUrls.signUp, httpMethod: .post, requestBody: parameters) { result, statusCode, isSuccess, error in
                if isSuccess{
                    let data = result["data"] as! [String:Any]
                    let token = data["token"] as! String
                    UserDefaults.standard.setValue(token, forKey: "token")
                    completion(true,"")
                }else{
                    completion(false,error)
                }
            }//apiCallEnd
        }else{
            completion(false,validationResult.error)
        }
    }
}
