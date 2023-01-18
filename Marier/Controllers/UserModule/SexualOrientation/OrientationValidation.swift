//
//  OrientationValidation.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
 
struct OrientationValidation{
    
    func validate(requestData: [String])->validateFields{
        if requestData.isEmpty{
            return validateFields(success: false, error: "Please select atleast one orientation")
        }else if requestData.count > 3{
            return validateFields(success: false, error: "You can only select upto three Orientations")
        }
        return validateFields(success: true, error: "")
    }
}
