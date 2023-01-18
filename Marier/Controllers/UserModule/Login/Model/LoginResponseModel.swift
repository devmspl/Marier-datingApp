//
//  LoginResponseModel.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation
 
struct LoginResponseModel: Decodable{
    let isSuccess: Bool?
    let statusCode: Int?
    let message: String?
    let data: LoginData?
    
    enum codingKeys: String,CodingKey{
        case isSuccess
        case statusCode
        case message
        case data
    }
}

struct LoginData:Decodable{
    
    let token: String
    
    enum codingKeys: String,CodingKey{
        case token
    }
}


