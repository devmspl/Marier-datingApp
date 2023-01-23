//
//  SignUpVM.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import UIKit
import DropDown

class SignUpVM: NSObject {
    
    let drop = DropDown()
    let genderArray = ["Male","Female","Others"]
    //MARK: - api call
    func apiCall(requestData:SignUpModel,completion: @escaping(Bool,String)->()){
        
        let validationResult = SignUpValidation().validate(request: requestData)
        
        if validationResult.success{
            //            ApiCall Start
            ApiManager.shared.hitApis(requestUrl: ApiUrls.signUp, httpMethod: .post, requestBody: requestData) { result, statusCode, isSuccess, error in
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
    
//MARK: - genderDropDown
    func selectGender(anchorView: UITextField){
        drop.show()
        drop.anchorView = anchorView
        drop.dataSource = genderArray
        drop.selectionAction = { [unowned self](index: Int,item: String) in
            drop.hide()
            anchorView.text = item
        }
    }
}
