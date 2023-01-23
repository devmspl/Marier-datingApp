//
//  ConvertAsset.swift
//  Marier
//
//  Created by MacBook M1 on 23/01/23.
//

import Foundation
import Photos
import UIKit

struct ConvertAsset{
    func toImage(asset:[PHAsset],completion:@escaping([UIImage])->()){
        
            var imageToSend = [UIImage]()
            for i in 0..<asset.count {

                        let manager = PHImageManager.default()
                        let option = PHImageRequestOptions()
                        var thumbnail = UIImage()
                        option.isSynchronous = true
                        manager.requestImage(for: asset[i],targetSize: CGSize(width: 200, height: 200), contentMode: PHImageContentMode.aspectFill, options: option, resultHandler: { (result, info) -> Void in
                            thumbnail = result!
                        })

                        let data = thumbnail.jpegData(compressionQuality: 0.7)
                        let newImage = UIImage(data: data!)
                        imageToSend.append(newImage!)
                }

                      completion(imageToSend)
                
        
    }
}
