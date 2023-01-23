//
//  Model.swift
//  Marier
//
//  Created by MacBook M1 on 17/01/23.
//

import Foundation

struct SignUpModel:Codable{
    let name,phoneNumber,sex,dob: String
    let location: Location
    let address: String
}
