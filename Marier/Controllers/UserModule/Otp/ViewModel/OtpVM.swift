//
//  OtpVM.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import UIKit


class OtpVM: NSObject {
    var userData: UserData?
//ValidateOtp
    func apiCall(otp:OtpRequestModel,completion: @escaping(Bool,String)->()){
        let validationResult = OTPValidation().validateOtp(otp: otp)
        if validationResult.success{
            //
            ApiManager.shared.hitApiWithResponse(requestUrl:ApiUrls.otp, httpMethod: .post, requestBody: otp, responseData: BaseResponse<UserData>.self) { result, statusCode, isSuccess, error in
                if isSuccess{
                    self.userData = (result?.data)!
                    let token = result?.token
                    let id = result?.data?.id
                    UserDefaults.standard.setValue(token, forKey: "token")
                    UserDefaults.standard.setValue(id, forKey: "id")
                    completion(true,"")
                }else{
                    completion(false,error)
                }
            }
            
            //
//            ApiManager.shared.hitApis(requestUrl: ApiUrls.otp, httpMethod: .post, requestBody: otp) { result, statusCode, isSuccess, error in
//                if isSuccess{
//                    let data = result["data"] as! [String: Any]
//                    let token = result["token"] as! String
//                    let id = data["id"] as! String
//                    UserDefaults.standard.setValue(token, forKey: "token")
//                    UserDefaults.standard.setValue(id, forKey: "id")
//                    completion(true,"")
//                }else{
//                    completion(false,error)
//                }
//            }//
            ////
        }else{
            completion(false,validationResult.error)
        }
    }
    
}
