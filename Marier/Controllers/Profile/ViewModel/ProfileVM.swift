//
//  ProfileVM.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation
import UIKit

class ProfileVM: NSObject{
///
///
    var userData: UserData?
   
///
///
    func getProfileData(completion:@escaping(Bool,String)->()){
        ApiManager.shared.getDataApi(requestUrl: ApiUrls.getCurrentUser+getUserId(), httpMethod: .get, resultType: BaseResponse<UserData>.self) { result, statusCode, isSuccess, error in
            if isSuccess{
                self.userData = result?.data
                completion(isSuccess,"")
            }else{
                completion(isSuccess,error)
            }
        }
    }
///
    ///
    func uploadProfileImage(image: [UIImage]){
        ApiManager.shared.uploadImages(images: image) { percent in
            if percent == 1.0{
                print("image Sucessfully uploaded")
            }
        } completion: { result, message in
            print(message,result)
        }

    }
    ///
    ///
}
