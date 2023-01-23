//
//  LikeRequestModel.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import Foundation

struct LikeRequestModel: Codable{
    let likeBy,likeTo: String
    let isSuperLike: Bool
}
