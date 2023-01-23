//
//  ProfileVM.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation

class ProfileVM: NSObject{
///
///
   
///
///
    func getProfileData(completion:@escaping(Bool,UserData,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getCurrentUser+getUserId(), httpMethod: .get, resultType: BaseResponse<UserData>.self) { result, statusCode, isSuccess, error in
            if isSuccess{
                completion(isSuccess,(result?.data)!,"")
            }else{
//                completion(isSuccess,UserData,error)
            }
        }
    }
///
}
