//
//  LoginValidation.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct LoginValidation{
    func validate(loginRequest: LoginModel)->validateFields{
        if loginRequest.phoneNumber.isEmpty{
            return validateFields(success: false, error: "Please enter mobile number")
        }
        return validateFields(success: true, error: "")
    }
}
