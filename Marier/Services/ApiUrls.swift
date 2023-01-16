//
//  ApiUrls.swift
//  Marier
//
//  Created by MacBook M1 on 13/01/23.
//

import Foundation

public var baseUrl = "http://18.189.74.89:9001/api/v1/"

struct ApiUrls{
    
    public static var signUp                    = baseUrl + "users/create"
    public static var login                     = baseUrl + "users/loginOtp"
    public static var otp                       = baseUrl + "users/loginOtpVerification"
    
}
