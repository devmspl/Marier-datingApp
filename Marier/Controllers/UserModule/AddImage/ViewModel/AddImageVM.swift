//
//  AddInterestVM.swift
//  Marier
//
//  Created by MacBook M1 on 06/01/23.
//

import UIKit

class AddImageVM: NSObject {

    var arrayData = [UIImage]()
    
    
    func uploadImageApi(completion:@escaping(Bool,String)->()){
        let validationResult = ValidateImages().validate(images: arrayData)
        
        if validationResult.success{
//            ApiManager.shared.uploadMultipleImages(images: arrayData) {  [weak self] percent in
//                guard let _ = self else {
//                  return
//                }
//                if percent == 1.0{
//                    completion(true,"success")
//                }else{
//                    completion(false,"Unable to upload images")
//                }
//            } completion: { result in
//                print(result)
//            }
            
            ApiManager.shared.uploadMultipleImages(
                images: arrayData,
                        progress: { [weak self] percent in
                           guard let _ = self else {
                             return
                           }
                           print("Status: \(percent)")
                            print(self!.arrayData.count)
                          if percent == 1.0{
                            completion(true,"success")
                           }
                            else{
                                completion(false,"Status: \(percent)")
                            }
                         },
                         completion: { [weak self] result,message in
                           guard let _ = self else {
                             return
                           }
                       })
        }else{
            completion(false,validationResult.error)
        }
       

    }
}
