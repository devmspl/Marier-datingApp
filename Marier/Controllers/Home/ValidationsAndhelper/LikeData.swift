//
//  LikeData.swift
//  Marier
//
//  Created by MacBook M1 on 20/01/23.
//

import Foundation

struct LikeData{
    func swipeDirection(likeTo: String,direction: String)->LikeRequestModel{
        if direction == "up"{
            return LikeRequestModel(likeBy: getUserId(), likeTo: likeTo, isSuperLike: true)
        }
        return LikeRequestModel(likeBy: getUserId(), likeTo: likeTo, isSuperLike: false)
    }
}
