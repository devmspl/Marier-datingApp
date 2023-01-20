//
//  Model.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation

struct SignUpModel:Encodable{
    let name,phoneNumber,sex,dob: String
//    let location: LocRequest
    let address: String
}

struct LocRequest: Encodable{
    let type: String
    let coordinates: [Double]
}
