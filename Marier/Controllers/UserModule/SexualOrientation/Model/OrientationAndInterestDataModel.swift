//
//  OrientationData.swift
//  Marier
//
//  Created by MacBook M1 on 18/01/23.
//

import Foundation

struct OrientationAndInterestDataModel:Codable {
    let id, type: String
    let isDeleted: Bool
    let createdAt, updatedAt: String
    
    enum CodingKeys: String,CodingKey{
        case id = "_id"
        case type,createdAt,updatedAt
        case isDeleted = "is_deleted"
    }
}
