//
//  OtpValidations.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct OTPValidation{
    
    func validateOtp(otp:OtpRequestModel)->validateFields{
        if otp.otp.isEmpty {
            return validateFields(success: false, error: "Please enter OTP")
        }else if otp.otp.count < 4{
            return validateFields(success: false, error: "Please enter Valid OTP")
        }
       return validateFields(success: true, error: "")
    }
    
    
}
