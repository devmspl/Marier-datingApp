//
//  SexualOrientationVM.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class SexualOrientationVM: NSObject {

    
//Variables
    let dataArray = ["Straight","Gay","Bisexual","Lesbian","Asexual","Demisexuial","Bicurious","Pansexual","Queer"]
    var selectedIndex = [Int]()
    var selectedInterests = [String]()
    var orientationList = [OrientationAndInterestDataModel]()

//MARK: - Post ApiCall
    func apiCall(orientations: [String],completion: @escaping(Bool,String)->()){
        ///
        let validationResult = OrientationValidation().validate(requestData: orientations)
        ///
        if validationResult.success{
            //ApiCallStart
            let requestBody = ["sexualOrientations":orientations]
            ApiManager.shared.hitApis(requestUrl: ApiUrls.sexualOrientation+getUserId(), httpMethod: .put, requestBody: requestBody) { result, statusCode, isSuccess, error in
                if isSuccess{
                    completion(isSuccess,"")
                }else{
                    completion(false,error)
                }
            }
            //ApicallEnds
        }else{
            completion(false,validationResult.error)
        }
    }
    
//MARK: - get ApiCall
    func getOrientationData(completion: @escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getSexualOrientation, httpMethod: .get, resultType: BaseResponse<[OrientationAndInterestDataModel]>.self, completion: { result, statusCode, isSuccess, error in
            if isSuccess{
                self.orientationList = (result?.data!)!
                completion(true,"")
            }else{
                completion(false,error)
            }
        })
    }
}
