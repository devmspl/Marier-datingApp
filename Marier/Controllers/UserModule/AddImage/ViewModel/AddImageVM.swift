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
      
            ApiManager.shared.uploadImages(
                requestUrl: ApiUrls.uploadGalleryImages,
                images: arrayData,
                        progress: { [weak self] percent in
                           guard let _ = self else {
                               completion(false,"percent\(percent)")
                             return
                           }
                           print("Status: \(percent)")
                            print(self!.arrayData.count)
                          if percent == 1.0{
                            completion(true,"success")
                           }
                         },
                         completion: { [weak self] result,message in
                           guard let _ = self else {
                             return
                           }
                       })
        }
}
