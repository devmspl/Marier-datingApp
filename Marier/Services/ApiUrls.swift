//
//  ApiUrls.swift
//  Marier
//
//  Created by MacBook M1 on 13/01/23.
//

import Foundation

public var baseUrl = "http://18.189.74.89:9001/api/v1/"

struct ApiUrls{

//MARK: - userModule api endpoints
    public static var signUp                    = baseUrl + "users/create"
    ///
    public static var login                     = baseUrl + "users/loginOtp"
    ///
    public static var otp                       = baseUrl + "users/loginOtpVerification"
    ///
    public static var sexualOrientation         = baseUrl + "users/addSexualOrientaion/"
   ///
    public static var getSexualOrientation      = baseUrl + "sexualOrientations/getAll"
   ///
    public static var getInterests              = baseUrl + "interests/getAll"
    ///
    public static var addInterest               = baseUrl + "users/addIntersts/"
    ///
    public static var ulpoadGalleryImages       = baseUrl + "users/uploadImagesByUserId/"
    ///
    public static var updateUser                = baseUrl + "users/update/"
    
//MARK: - home screen api endpoints
    ///
    public static var getMatchList              = baseUrl + "users/matchList"
    public static var getAll                    = baseUrl + "users/getAll"
    public static var getRandomList             = baseUrl + "users/randomList/"
}
