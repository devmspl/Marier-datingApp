//
//  SearchVM.swift
//  Marier
//
//  Created by MacBook M1 on 25/01/23.
//

import UIKit

class SearchVM: NSObject {

    var dataArray = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3"),UIImage(named: "1")]
    
    var likeUsers = [SearchDataModel]()
    
    func getLikeUsers(completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getUsersLike+getUserId(), httpMethod: .get, resultType: BaseResponse<[SearchDataModel]>.self) { result, statusCode, isSuccess, error in
            if isSuccess{
                 self.likeUsers = (result?.data)!
                completion(isSuccess,"")
            }else{
                completion(isSuccess,error)
            }
        }
    }
}
