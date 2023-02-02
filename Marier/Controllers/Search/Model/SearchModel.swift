//
//  SearchModel.swift
//  Marier
//
//  Created by MacBook M1 on 21/01/23.
//

import Foundation

struct SearchDataModel: Codable {
    let id: String
    let likeBy: LikeBy
    let likeTo: String

    let isLiked, isDeleted: Bool

    
    enum CodingKeys: String,CodingKey{
        case id = "_id"
        case likeBy,isLiked,likeTo
        case isDeleted = "is_deleted"
      
    }
}

// MARK: - LikeBy
struct LikeBy: Codable {
    let id, name, sex, avatar: String
    let gallery: [UserGallery]
    
    enum CodingKeys: String,CodingKey{
        case id = "_id"
        case name,sex,avatar
        case gallery
    }
}
