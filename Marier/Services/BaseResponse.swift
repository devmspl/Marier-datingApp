//
//  BaseResponse.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct BaseResponse<T:Codable>:Codable{
    var statusCode: Int?
    var message: String?
    var isSuccess: Bool?
    var data :T?
    var token: String?
}
