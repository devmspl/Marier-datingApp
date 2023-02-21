//
//  CheckImages.swift
//  Marier
//
//  Created by MacBook M1 on 23/01/23.
//

import Foundation
import UIKit
import Photos

struct CheckImages{
    func check(images:[PHAsset])->validateFields{
        if images.isEmpty{
            return validateFields(success: false, error: "Please select images")
        }else if images.count < 2{
            return validateFields(success: false, error: "Please select atleast 2 images")
        }else if images.count > 4{
            return validateFields(success: false, error: "You can only select upto four images")
        }else{
           return validateFields(success: true, error: "")
        }
    }
}
