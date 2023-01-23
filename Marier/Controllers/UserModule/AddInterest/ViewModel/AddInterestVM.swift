//
//  AddInterestVM.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import UIKit

class AddInterestVM: NSObject {
//
    var interestArray = [OrientationAndInterestDataModel]()
    var selectedIndex = [Int]()
    var selectedInterests = [String]()
//MARK: - getInterestApi/////
    func getInterestsApi(completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getInterests, httpMethod: .get, resultType: BaseResponse<[OrientationAndInterestDataModel]>.self, completion: { result, statusCode, isSuccess, error in
            if isSuccess{
                self.interestArray = (result?.data!)!
                completion(true,"")
            }else{
                completion(false,error)
            }
        })
    }
    
//MARK: - addInterestApi//////
    func addInterests(completion:@escaping(Bool,String)->()){
        let requestBody = InterestRequestModel(interests: selectedInterests)
        ApiManager.shared.hitApis(requestUrl: ApiUrls.addInterest+getUserId(), httpMethod: .put, requestBody: requestBody) { result, statusCode, isSuccess, error in
            if isSuccess{
                completion(true,"")
            }else{
                completion(false,error)
            }
        }
    }
}
