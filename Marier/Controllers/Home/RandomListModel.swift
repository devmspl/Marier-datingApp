//
//  File.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import Foundation

struct RandomListModel: Codable{
    let id: String
    let name: String
    let sex: String
    let avatar: String
    let dob: String
    let gallery: [UserGallery]
    let location: Location
    
    enum CodingKeys: String,CodingKey{
        case id = "_id"
        case name,sex,avatar,dob,gallery
        case location = "location"
    }
}
