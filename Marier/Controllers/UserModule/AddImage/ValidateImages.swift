//
//  ValidateImages.swift
//  Marier
//
//  Created by MacBook M1 on 19/01/23.
//

import Foundation
import UIKit

struct ValidateImages{
    func validate(images:[UIImage])->validateFields{
        if images.isEmpty{
            return validateFields(success: false, error: "Please select images to continue")
        }else if images.count < 2{
            return validateFields(success: false, error: "Please select atleast two images to continue")
        }else{
            return validateFields(success: true, error: "")
        }
    }
}
