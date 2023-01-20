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
            let loc : [String:Any] = ["type":"Point",
                                      "coordinates":[75.75,74.5]]
            let parameters: [String:Any] = ["name":requestData.name,
                                            "dob":requestData.dob,
                                            "phoneNumber":requestData.phoneNumber,
                                            "sex":requestData.sex.lowercased(),
                                            "location":loc,
                                            "address":requestData.address]
            print(parameters)
//            ApiCall Start
            ApiManager.shared.hitApis(requestUrl: ApiUrls.signUp, httpMethod: .post, requestBody: parameters) { result, statusCode, isSuccess, error in
                if isSuccess{
                    let data = result["data"] as! [String:Any]
                    let token = data["token"] as! String
                    UserDefaults.standard.setValue(token, forKey: "token")
                    completion(true,"")
                }else{
                    completion(false,error)
                }
            }//apiCall End
        }else{
            completion(false,validationResult.error)
        }
    }
}
