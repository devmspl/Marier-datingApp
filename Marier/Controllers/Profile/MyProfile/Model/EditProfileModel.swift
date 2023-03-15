//
//  EditProfileModel.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation

struct EditProfileModel: Codable{
    var name: String
    var dob: String
    var location: Location
    var language: String
    var showMe: String
    var ageRange: AgeRange
    var distance: Int
}
