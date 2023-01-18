//
//  SignUpValidation.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct SignUpValidation{
    
    func validate(request: SignUpModel)->validateFields{
        if request.name.isEmpty{
            return validateFields(success: false, error: "Please enter name")
        }else if request.sex.isEmpty{
            return validateFields(success: false, error: "Please select sex")
        }else if request.dob.isEmpty{
            return validateFields(success: false, error: "Please enter date of birth")
        }else if request.phoneNumber.isEmpty{
            return validateFields(success: false, error: "Please enter phone number")
        }else{
            return validateFields(success: true, error: "")
        }
    }

    
}
