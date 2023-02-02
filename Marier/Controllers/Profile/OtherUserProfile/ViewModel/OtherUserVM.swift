//
//  OtherUserVM.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import Foundation

class OtherUserVM: NSObject {

    var userData: UserData?
    
    func getUserData(id:String,completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getCurrentUser+id, httpMethod: .get, resultType: BaseResponse<UserData>.self) { [self] result, statusCode, isSuccess, error in
            if isSuccess{
                userData = (result?.data)!
                completion(isSuccess,"")
            }else{
                completion(false,error)
            }
        }
    }
    
}
