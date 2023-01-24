//
//  NearbyVM.swift
//  Marier
//
//  Created by MacBook M1 on 07/01/23.
//

import Foundation

class NearbyVM: NSObject {
///
    var nearbyUsers = [RandomListModel]()
    ///
    func getNearbyUsers(completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getRandomList+getUserId(), httpMethod: .get, resultType: BaseResponse<[RandomListModel]>.self) { [self] result, statusCode, isSuccess, error in
            if isSuccess{
                nearbyUsers = (result?.data)!
                completion(isSuccess,"")
            }else{
                completion(false,error)
            }
        }
    }
}
